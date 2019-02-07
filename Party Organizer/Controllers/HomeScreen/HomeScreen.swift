//
//  ViewController.swift
//  Party Organizer
//
//  Created by Uros Smiljanic on 06/02/2019.
//  Copyright © 2019 Uros Smiljanic. All rights reserved.
//

import UIKit

class HomeScreen: UITableViewController {
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let cellId = "cellId"
    
    static var listOfParties: [Party] = {
        let first = Party(title: "New Years", date: "31.12.2018", partyDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", members: [])
        let second = Party(title: "Party 1", date: "01.01.2019", partyDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", members: [])
        let third = Party(title: "Party 2", date: "21.02.2019", partyDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", members: [])
        let fourth = Party(title: "Party 3", date: "22.03.2019", partyDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", members: [])
        
        return [first, second, third, fourth]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Parties"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(handleAddingNewParty))
        
        
        tableView.register(HomeScreenCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    func removeEmptyScreen() {
        containerView.removeFromSuperview()
    }
    
    @objc func handleAddingNewParty() {
        let vc = UINavigationController(rootViewController: CreateNewPartyScreen())
        present(vc, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeScreen.listOfParties.count//HomeScreen.sampleData.parties.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HomeScreenCell
        
        let data = HomeScreen.listOfParties
            
            cell.titleLabel.text = data[indexPath.item].title
            cell.dateLabel.text = data[indexPath.item].date
            cell.descriptionLabel.text = data[indexPath.item].partyDescription
            return cell

    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            HomeScreen.listOfParties.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            if HomeScreen.listOfParties.count == 0 {
                handleEmptyHomeScreen()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UINavigationController(rootViewController: CreateNewPartyScreen())
        
        CreateNewPartyScreen.partyId = indexPath.item
        CreateNewPartyScreen.partyName = HomeScreen.listOfParties[indexPath.item].title ?? ""
        CreateNewPartyScreen.partyDate = HomeScreen.listOfParties[indexPath.item].date ?? ""
        CreateNewPartyScreen.partyDescription = HomeScreen.listOfParties[indexPath.item].partyDescription ?? ""
        
        for index in 0..<HomeScreen.listOfParties[indexPath.item].invitedMembers.count {
            InviteUsersScreen.invitedMembers.append(HomeScreen.listOfParties[indexPath.item].invitedMembers[index])
        }
        
        
        present(vc, animated: true, completion: nil)
    }
    
    func handleEmptyHomeScreen() {
        
        
        let noticeLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 16.0)
            label.numberOfLines = 2
            label.text = "You have no party. \n Create some!"
            
            return label
        }()
        
        let createPartyButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = UIColor(hexString: "2766DE")
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.layer.cornerRadius = 7.5
            button.layer.masksToBounds = true
            button.setTitle("Create party", for: .normal)
            
            button.addTarget(self, action: #selector(handleAddingNewParty), for: .touchUpInside)
            return button
        }()
        
        self.view.addSubview(containerView)
        containerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailling: view.safeAreaLayoutGuide.trailingAnchor)
        
        containerView.addSubview(noticeLabel)
        noticeLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailling: containerView.trailingAnchor, padding: .init(top: 200, left: 0, bottom: 0, right: 0))
        
        containerView.addSubview(createPartyButton)
        createPartyButton.anchor(top: noticeLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailling: containerView.trailingAnchor, padding: .init(top: 100, left: 30, bottom: 0, right: 30), size: .init(width: 0, height: 50))
    }
    
}
