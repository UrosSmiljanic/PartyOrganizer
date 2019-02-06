//
//  PartiesDummyData.swift
//  Party Organizer
//
//  Created by Uros Smiljanic on 06/02/2019.
//  Copyright © 2019 Uros Smiljanic. All rights reserved.
//

import UIKit

class SampleParties: NSObject {
    
    var parties = [Party]()
    
    static func sampleParties() -> SampleParties {
        let sampleData = SampleParties()
        
        var party = [Party]()
        
        //logic
        let newYears = Party()
        newYears.title = "New Years"
        newYears.date = "31.12.2018"
        newYears.partyDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        party.append(newYears)
        
        let firstParty = Party()
        firstParty.title = "Party 1"
        firstParty.date = "01.01.2019"
        firstParty.partyDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        party.append(firstParty)
        
        let secondParty = Party()
        secondParty.title = "Party 2"
        secondParty.date = "21.02.2019"
        secondParty.partyDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        party.append(secondParty)
        
        let thirdParty = Party()
        thirdParty.title = "Party 3"
        thirdParty.date = "22.03.2019"
        thirdParty.partyDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        party.append(thirdParty)
        
        sampleData.parties = party
        
        return sampleData
    }
    
}

class Party: NSObject {
    var title: String?
    var date: String?
    var partyDescription: String?
}
