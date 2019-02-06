//
//  ViewController.swift
//  Party Organizer
//
//  Created by Uros Smiljanic on 06/02/2019.
//  Copyright © 2019 Uros Smiljanic. All rights reserved.
//

import UIKit

class HomeScreen: UITableViewController {
    
    private let cellId = "cellId"
    
    var sampleData: SampleParties?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sampleData = SampleParties.sampleParties()

        navigationItem.title = "Parties"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(handleAddingNewParty))
        

        tableView.register(HomeScreenCell.self, forCellReuseIdentifier: cellId)

    }

    @objc func handleAddingNewParty() {
        print("Lets add new party")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData?.parties.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HomeScreenCell
        
        if let data = sampleData {
            
            cell.titleLabel.text = data.parties[indexPath.item].title
            cell.dateLabel.text = data.parties[indexPath.item].date
            cell.descriptionLabel.text = data.parties[indexPath.item].partyDescription
            return cell
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            sampleData?.parties.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
