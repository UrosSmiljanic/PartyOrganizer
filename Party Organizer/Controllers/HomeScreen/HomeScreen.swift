//
//  ViewController.swift
//  Party Organizer
//
//  Created by Uros Smiljanic on 06/02/2019.
//  Copyright © 2019 Uros Smiljanic. All rights reserved.
//

// The initial view controller that present list of parties that are created

import UIKit

class HomeScreen: UITableViewController {
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Parties"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(handleAddingNewParty))
        
        
        tableView.register(HomeScreenCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    func removeEmptyScreen() {
        containerView.removeFromSuperview()
    }
    
    // The function that handles switching to the view controller for adding the new party
    @objc func handleAddingNewParty() {
        
        CommonData.partyId = CommonData.listOfParties.count
        
        CommonData.listOfParties.append(Party(title: "", date: "", partyDescription: "", members: []))
        
        CommonData.addBtnCheck = true
        
        let vc = UINavigationController(rootViewController: CreateNewPartyScreen())
        present(vc, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CommonData.listOfParties.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HomeScreenCell
        
        let data = CommonData.listOfParties
        
        cell.titleLabel.text = data[indexPath.item].title
        cell.dateLabel.text = data[indexPath.item].date
        cell.descriptionLabel.text = data[indexPath.item].partyDescription
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CommonData.listOfParties.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            if CommonData.listOfParties.count == 0 {
                handleEmptyHomeScreen()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UINavigationController(rootViewController: CreateNewPartyScreen())
        
        CommonData.partyId = indexPath.item
        CommonData.partyName = CommonData.listOfParties[indexPath.item].title ?? ""
        CommonData.partyDate = CommonData.listOfParties[indexPath.item].date ?? ""
        CommonData.partyDescription = CommonData.listOfParties[indexPath.item].partyDescription ?? ""
        
        for index in 0..<CommonData.listOfParties[indexPath.item].invitedMembers.count {
            CommonData.invitedMembers.append(CommonData.listOfParties[indexPath.item].invitedMembers[index])
        }
        
        present(vc, animated: true, completion: nil)
    }
    
    // The function that handles showing an empty screen if there are no parties
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
