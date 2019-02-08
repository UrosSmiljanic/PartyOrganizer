//
//  HomeScreenCell.swift
//  Party Organizer
//
//  Created by Uros Smiljanic on 06/02/2019.
//  Copyright © 2019 Uros Smiljanic. All rights reserved.
//

// Table view cell for the home view controller

import UIKit

class HomeScreenCell: BaseTableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .left
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .left
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 3
        return label
    }()
    
    let rightArrowView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "rightArrow")
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(titleLabel)
        titleLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailling: self.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 0, right: 5))
        
        titleLabel.addSubview(rightArrowView)
        rightArrowView.anchor(top: titleLabel.topAnchor, leading: nil, bottom: titleLabel.bottomAnchor, trailling: titleLabel.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 12), size: .init(width: 20, height: 20))
        
        addSubview(dateLabel)
        dateLabel.anchor(top: titleLabel.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailling: self.trailingAnchor, padding: .init(top: 0, left: 5, bottom: 0, right: 5))
        
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: dateLabel.bottomAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailling: self.trailingAnchor, padding: .init(top: 0, left: 5, bottom: 5, right: 5))
        
    }
    
}
