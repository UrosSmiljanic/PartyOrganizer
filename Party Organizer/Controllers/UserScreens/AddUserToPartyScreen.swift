//
//  AddUserToPartyScreen.swift
//  Party Organizer
//
//  Created by Uros Smiljanic on 06/02/2019.
//  Copyright © 2019 Uros Smiljanic. All rights reserved.
//

// The view controller that show a list of available parties on which user can attend

import UIKit

class AddUserToPartyScreen: UITableViewController {
    
    static var navTitle = ""
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = AddUserToPartyScreen.navTitle
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(goBack))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    @objc func goBack() {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CommonData.listOfParties.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = CommonData.listOfParties[indexPath.item].title
        
        for index in 0..<CommonData.listOfParties[indexPath.item].invitedMembers.count {
            
            if CommonData.userId == CommonData.listOfParties[indexPath.item].invitedMembers[index].id {
                
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            
            
            for index in 0..<CommonData.listOfParties[indexPath.item].invitedMembers.count {
                
                if CommonData.userId == CommonData.listOfParties[indexPath.item].invitedMembers[index].id {
                    CommonData.listOfParties[indexPath.item].invitedMembers.remove(at: index)
                    return
                }
            }
            
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark

            CommonData.listOfParties[indexPath.item].invitedMembers.append(Party.Members.init(dictionary: ["id" : CommonData.userId, "userName" : CommonData.userName]))
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
