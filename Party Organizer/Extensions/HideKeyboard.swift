//
//  HideKeyboard.swift
//  Party Organizer
//
//  Created by Uros Smiljanic on 07/02/2019.
//  Copyright © 2019 Uros Smiljanic. All rights reserved.
//

// An extension for hiding keyboard after finish text input or by a tap on the screen outside the keyboard

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
