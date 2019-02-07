//
//  PartiesDummyData.swift
//  Party Organizer
//
//  Created by Uros Smiljanic on 06/02/2019.
//  Copyright © 2019 Uros Smiljanic. All rights reserved.
//

import UIKit

class Party: NSObject {
    
    //MARK: Properties
    
    var title: String?
    var date: String?
    var partyDescription: String?
    var invitedMembers: [Members]

    //MARK: Types
    
    struct Members {

        var id: Int
        var userName: String
        
        init(dictionary: [String: Any]){
            id = dictionary["id"] as! Int
            userName = dictionary["userName"] as! String
        }
        
    }
    
    //MARK: Initialization
    
    init(title: String, date: String, partyDescription: String, members: [Members]) {
        
        // Initialize stored properties
        self.title = title
        self.date = date
        self.partyDescription = partyDescription
        self.invitedMembers = members
    }
    
}
