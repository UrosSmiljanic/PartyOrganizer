//
//  MembersScreenCell.swift
//  Party Organizer
//
//  Created by Uros Smiljanic on 06/02/2019.
//  Copyright © 2019 Uros Smiljanic. All rights reserved.
//

import UIKit

class MembersScreenCell: BaseTableViewCell {
    
    let thumbailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        imageView.roundedImage()
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.text = " TEST "
        return label
    }()

    override func setupViews() {
        super.setupViews()
        
        addSubview(thumbailImageView)
        thumbailImageView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailling: nil, padding: .init(top: 5, left: 5, bottom: 5, right: 0), size: .init(width: 60, height: 60))
        
        addSubview(nameLabel)
        nameLabel.anchor(top: self.topAnchor, leading: thumbailImageView.trailingAnchor, bottom: self.bottomAnchor, trailling: self.trailingAnchor, padding: .init(top: 0, left: 5, bottom: 0, right: 0))
        
    }

}
