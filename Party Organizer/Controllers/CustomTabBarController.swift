//
//  CustomTabBarController.swift
//  Party Organizer
//
//  Created by Uros Smiljanic on 06/02/2019.
//  Copyright © 2019 Uros Smiljanic. All rights reserved.
//

// The tab bar controller initialization for home end members controllers

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let partiesNavController = UINavigationController(rootViewController: HomeScreen())
        
        partiesNavController.tabBarItem.title = "Parties"
        partiesNavController.tabBarItem.image = UIImage(named: "parties")
        
        let membersNavController = UINavigationController(rootViewController: MembersScreen())
        membersNavController.tabBarItem.title = "Members"
        membersNavController.tabBarItem.image = UIImage(named: "members")
        
        viewControllers = [partiesNavController, membersNavController]
    }
    
}
