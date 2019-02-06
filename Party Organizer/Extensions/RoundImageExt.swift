//
//  RoundImageExt.swift
//  Party Organizer
//
//  Created by Uros Smiljanic on 06/02/2019.
//  Copyright © 2019 Uros Smiljanic. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func roundedImage() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
}
