//
//  MembersScreen.swift
//  Party Organizer
//
//  Created by Uros Smiljanic on 06/02/2019.
//  Copyright © 2019 Uros Smiljanic. All rights reserved.
//

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
            ProfileScreen.UserProfile.name = user[indexPath.item].username
            ProfileScreen.UserProfile.gender = user[indexPath.item].gender.rawValue
            ProfileScreen.UserProfile.email = user[indexPath.item].email
            ProfileScreen.UserProfile.about = user[indexPath.item].aboutMe
            ProfileScreen.UserProfile.phoneNum = user[indexPath.item].cell
            ProfileScreen.UserProfile.photoUrl = user[indexPath.item].photo
            ProfileScreen.UserProfile.id = user[indexPath.item].id
        }
       
        present(vc, animated: true, completion: nil)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

