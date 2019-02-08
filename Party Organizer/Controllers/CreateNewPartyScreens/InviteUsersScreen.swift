//
//  InviteUsersScreen.swift
//  Party Organizer
//
//  Created by Uros Smiljanic on 07/02/2019.
//  Copyright © 2019 Uros Smiljanic. All rights reserved.
//

// The view controller that show a list of the members that are taken via an API call and check them if they are already invited to the party

import UIKit

class InviteUsersScreen: UITableViewController {
    
    private let cellId = "cellId"
    
    let apiCall = "http://api-coin.quantox.tech/profiles.json"
    
    var user: Users?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Members"
        
        tableView.register(MembersScreenCell.self, forCellReuseIdentifier: cellId)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(goBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSavingCheckedUsers))
        
        fetchGenericData(urlString: apiCall) { (users: Users) in
            self.user = users
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    // The function that handles the saving of invited users
    
    @objc func handleSavingCheckedUsers() {
        
        if let id = CommonData.partyId {
            
            CommonData.listOfParties[id].invitedMembers.removeAll()
            
            for index in 0..<CommonData.invitedMembers.count {
                CommonData.listOfParties[id].invitedMembers.append(CommonData.invitedMembers[index])
            }
            
        }
        
        CommonData.invitedMembers.removeAll()
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc func goBack() {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user?.profiles.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MembersScreenCell
        
        cell.nameLabel.text = user?.profiles[indexPath.item].username
        cell.thumbailImageView.load(url: URL(string: (user?.profiles[indexPath.item].photo)!)!)
        
        if let id = CommonData.partyId {
            
            for index in 0..<CommonData.listOfParties[id].invitedMembers.count {
                
                if user?.profiles[indexPath.item].id == CommonData.invitedMembers[index].id {
                    
                    cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                }
                
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            
            for index in 0..<CommonData.invitedMembers.count {
                if user?.profiles[indexPath.item].id == CommonData.invitedMembers[index].id {
                    CommonData.invitedMembers.remove(at: index)
                    return
                }
            }
            
        } else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            CommonData.invitedMembers.append(Party.Members.init(dictionary: ["id" : user?.profiles[indexPath.item].id ?? "", "userName" : user?.profiles[indexPath.item].username ?? ""]))
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
