//
//  CommonData.swift
//  Party Organizer
//
//  Created by Uros Smiljanic on 08/02/2019.
//  Copyright © 2019 Uros Smiljanic. All rights reserved.
//

// Variables that are available from any view controller

import Foundation

struct CommonData {
    static var partyId: Int?
    
    // Dummy data for initial parties
    
    static var listOfParties: [Party] = {
        let first = Party(title: "New Years", date: "31.12.2018", partyDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", members: [])
        let second = Party(title: "Party 1", date: "01.01.2019", partyDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", members: [])
        let third = Party(title: "Party 2", date: "21.02.2019", partyDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", members: [])
        let fourth = Party(title: "Party 3", date: "22.03.2019", partyDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", members: [])
        
        return [first, second, third, fourth]
    }()
    
    static var partyName = ""
    static var partyDate = ""
    static var partyDescription = ""
    
    static var invitedMembers = [Party.Members]()
    
    static var userName = String()
    static var userGender = String()
    static var userEmail = String()
    static var userAbout = String()
    static var userPhotoUrl = String()
    static var userPhoneNum = String()
    static var userId = Int()
    
    static var addBtnCheck: Bool = false
}
