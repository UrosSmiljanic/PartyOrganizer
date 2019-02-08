//
//  MembersScreen.swift
//  Party Organizer
//
//  Created by Uros Smiljanic on 06/02/2019.
//  Copyright © 2019 Uros Smiljanic. All rights reserved.
//

// The view controller that show a list of current members retrieved by API call

import UIKit

class MembersScreen: UITableViewController {
    
    private let cellId = "cellId"
    
    let apiCall = "http://api-coin.quantox.tech/profiles.json"
    
    var user: Users?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Members"
        
        tableView.register(MembersScreenCell.self, forCellReuseIdentifier: cellId)
        
        fetchGenericData(urlString: apiCall) { (users: Users) in
            self.user = users
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user?.profiles.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MembersScreenCell
        
        cell.nameLabel.text = user?.profiles[indexPath.item].username
        cell.thumbailImageView.load(url: URL(string: (user?.profiles[indexPath.item].photo)!)!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UINavigationController(rootViewController: ProfileScreen())
        
        if let user = user?.profiles {
            CommonData.userName = user[indexPath.item].username
            CommonData.userGender = user[indexPath.item].gender.rawValue
            CommonData.userEmail = user[indexPath.item].email
            CommonData.userAbout = user[indexPath.item].aboutMe
            CommonData.userPhoneNum = user[indexPath.item].cell
            CommonData.userPhotoUrl = user[indexPath.item].photo
            CommonData.userId = user[indexPath.item].id
        }
        
        present(vc, animated: true, completion: nil)
    }
}

