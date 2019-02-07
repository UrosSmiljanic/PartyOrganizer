//
//  ProfileScreen.swift
//  Party Organizer
//
//  Created by Uros Smiljanic on 06/02/2019.
//  Copyright © 2019 Uros Smiljanic. All rights reserved.
//

import UIKit

class ProfileScreen: UIViewController{

    
    struct UserProfile {
        static var name = String()
        static var gender = String()
        static var email = String()
        static var about = String()
        static var photoUrl = String()
        static var phoneNum = String()
        static var id = Int()
    }
    
    
    
    
    let thumbailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        imageView.roundedImage()
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    let aboutLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.text = "About:"
        return label
    }()
    
    let aboutMeDetailsLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Reprehenderit voluptatem eaque natus explicabo voluptate consequatur praesentium sit. Quis eveniet consectetur. Dolores consequatur inventore voluptatem fuga molestias delectus itaque. Sapiente quia unde voluptate illum non dignissimos sed placeat nemo. Voluptas ut sapiente quia sapiente. Quo ex et."
        return label
    }()
    
    lazy var addToPartyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(hexString: "2766DE")
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 7.5
        button.layer.masksToBounds = true
        button.setTitle("Add to party", for: .normal)
        
        button.addTarget(self, action: #selector(handleAddToParty), for: .touchUpInside)
        
        return button
    }()
    
    @objc func handleAddToParty() {
         let vc = UINavigationController(rootViewController: AddUserToPartyScreen())
        AddUserToPartyScreen.navTitle = UserProfile.name
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       
        navigationItem.title = "Profiles"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(goBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Call", style: .plain, target: self, action: #selector(callUser))
        
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(thumbailImageView)
        thumbailImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailling: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 10, left: (view.frame.size.width - 250) / 2, bottom: 0, right: (view.frame.size.width - 250) / 2)  ,size: .init(width: 250, height: 250))
        self.thumbailImageView.load(url: URL(string: UserProfile.photoUrl)!)

        view.addSubview(nameLabel)
        nameLabel.anchor(top: thumbailImageView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailling: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 40, left: 10, bottom: 0, right: 0))
        nameLabel.text = "Full name: \(UserProfile.name)"
        
        view.addSubview(genderLabel)
        genderLabel.anchor(top: nameLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailling: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 40, left: 10, bottom: 0, right: 0))
        genderLabel.text = "Gender: \(UserProfile.gender)"
        
        view.addSubview(emailLabel)
        emailLabel.anchor(top: genderLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailling: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 40, left: 10, bottom: 0, right: 0))
        emailLabel.text = "email: \(UserProfile.email)"
        
        view.addSubview(aboutLabel)
        aboutLabel.anchor(top: emailLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailling: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 40, left: 10, bottom: 0, right: 0))
        
        view.addSubview(aboutMeDetailsLabel)
        aboutMeDetailsLabel.anchor(top: aboutLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailling: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 0))
        aboutMeDetailsLabel.text = UserProfile.about
        
        view.addSubview(addToPartyButton)
        addToPartyButton.anchor(top: aboutMeDetailsLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailling: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 40, left: 30, bottom: 0, right: 30), size: .init(width: 0, height: 50))
    }
    
    @objc func goBack() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func callUser() {
        print("Calling")
        
        UserProfile.phoneNum.makeACall()
    }

}
