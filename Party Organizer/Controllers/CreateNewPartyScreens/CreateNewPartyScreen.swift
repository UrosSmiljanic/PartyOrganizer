//
//  CreateNewPartyScreen.swift
//  Party Organizer
//
//  Created by Uros Smiljanic on 06/02/2019.
//  Copyright © 2019 Uros Smiljanic. All rights reserved.
//

// The view controller that handle edit/creating a new party

import UIKit

class CreateNewPartyScreen: UIViewController {
    
    private let cellId = "cellId"
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        
        return view
    }()
    
    let partyNameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .lightGray
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        label.text = "Party name"
        
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        textField.placeholder = "Name"
        
        return textField
    }()
    
    let nameSeperator: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    let startDateLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .lightGray
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        label.text = "Start date and time"
        
        return label
    }()
    
    let dateSeperator: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    let txtDatePicker: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        textField.placeholder = "dd.mm.yyyy hh:mm"
        
        return textField
    }()
    
    let aboutContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        label.text = "Description:"
        
        return label
    }()
    
    let descriptionDetailsTextView: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .left
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 7.5
        textView.layer.masksToBounds = true
        
        return textView
    }()
    
    let rightArrowView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "rightArrow")
        return view
    }()
    
    let datePicker = UIDatePicker()
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Parties"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(goBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSavingNewParty))
        
        // The function that set up the initial view. Order the elements around the screen and defines their constraints
        setupViews()
        
        // The function that enables date picker for the date input field
        showDatePicker()
        
        // The functions that hide keyboard on tap or when the user finishes inputting
        hideKeyboardWhenTappedAround()
        hideKeyboard()
        
        nameTextField.text = CommonData.partyName
        txtDatePicker.text = CommonData.partyDate
        descriptionDetailsTextView.text = CommonData.partyDescription
    }
    
    // The function that saves the new party with error check if the user forgot to add text to mandatory fields
    @objc func handleSavingNewParty() {
        
        if let id = CommonData.partyId {
            
            if let title = nameTextField.text, let date = txtDatePicker.text, let description = descriptionDetailsTextView.text {
                if title != "" && date != "" && description != "" {
                    CommonData.listOfParties[id] = Party(title: title, date: date, partyDescription: description, members: CommonData.invitedMembers)
                    let vc = CustomTabBarController()
                    present(vc, animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: "Error: Some mandatory fields are empty", message: "Please enter party title, date and description", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    
                    self.present(alert, animated: true)
                }
            }
            
        } else {
            
            if let title = nameTextField.text, let date = txtDatePicker.text, let description = descriptionDetailsTextView.text {
                if title != "" && date != "" && description != "" {
                    CommonData.listOfParties.append(Party(title: title, date: date, partyDescription: description, members: []))
                    let vc = CustomTabBarController()
                    present(vc, animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: "Error: Some mandatory fields are empty", message: "Please enter party title, date and description", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    
                    self.present(alert, animated: true)
                }
            }
        }
        
    }
    
    // The function that takes the user back without saving any data
    @objc func goBack() {
        
        CommonData.partyId = nil
        CommonData.partyName = ""
        CommonData.partyDate = ""
        CommonData.partyDescription = ""
        
        if CommonData.addBtnCheck {
            CommonData.addBtnCheck = false
            CommonData.listOfParties.removeLast()
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func setupViews() {
        view.addSubview(inputsContainerView)
        inputsContainerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailling: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 12, bottom: 0, right: 12), size: .init(width: view.frame.width - 24, height: 102))
        
        inputsContainerView.addSubview(partyNameLabel)
        partyNameLabel.anchor(top: inputsContainerView.topAnchor, leading: nil, bottom: nil, trailling: inputsContainerView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 12), size: .init(width: 0, height: 50))
        
        inputsContainerView.addSubview(nameTextField)
        nameTextField.anchor(top: inputsContainerView.topAnchor, leading: inputsContainerView.leadingAnchor, bottom: nil, trailling: partyNameLabel.leadingAnchor, padding: .init(top: 0, left: 12, bottom: 0, right: 0), size: .init(width: 0, height: 50))
        
        inputsContainerView.addSubview(nameSeperator)
        nameSeperator.anchor(top: nameTextField.bottomAnchor, leading: inputsContainerView.leadingAnchor, bottom: nil, trailling: inputsContainerView.trailingAnchor, size: .init(width: 0, height: 1))
        
        inputsContainerView.addSubview(startDateLabel)
        startDateLabel.anchor(top: nameSeperator.bottomAnchor, leading: nil, bottom: nil, trailling: inputsContainerView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 12), size: .init(width: 0, height: 50))
        
        inputsContainerView.addSubview(txtDatePicker)
        txtDatePicker.anchor(top: nameSeperator.bottomAnchor, leading: inputsContainerView.leadingAnchor, bottom: nil, trailling: startDateLabel.leadingAnchor, padding: .init(top: 0, left: 12, bottom: 0, right: 0), size: .init(width: 0, height: 50))
        
        inputsContainerView.addSubview(dateSeperator)
        dateSeperator.anchor(top: startDateLabel.bottomAnchor, leading: inputsContainerView.leadingAnchor, bottom: nil, trailling: inputsContainerView.trailingAnchor, size: .init(width: 0, height: 1))
        
        view.addSubview(aboutContainerView)
        
        aboutContainerView.addSubview(descriptionLabel)
        descriptionLabel.anchor(top: aboutContainerView.topAnchor, leading: aboutContainerView.leadingAnchor, bottom: nil, trailling: aboutContainerView.trailingAnchor, padding: .init(top: 12, left: 12, bottom: 0, right: 12), size: .init(width: 0, height: 50))
        
        aboutContainerView.addSubview(descriptionDetailsTextView)
        descriptionDetailsTextView.anchor(top: descriptionLabel.bottomAnchor, leading: aboutContainerView.leadingAnchor, bottom: aboutContainerView.bottomAnchor, trailling: aboutContainerView.trailingAnchor, padding: .init(top: 12, left: 12, bottom: 12, right: 12))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView = UITableView(frame: self.view.frame, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = UIColor.white
        self.view.addSubview(tableView)
        
        tableView.anchor(top: inputsContainerView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailling: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 12, left: 12, bottom: 0, right: 12), size: .init(width: 0, height: 300))
        
        aboutContainerView.anchor(top: tableView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailling: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 12, left: 12, bottom: 12, right: 12))
    }
    
    func showDatePicker() {
        //Formate Date
        datePicker.datePickerMode = .dateAndTime
        
        //ToolBar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        txtDatePicker.inputAccessoryView = toolbar
        txtDatePicker.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy hh:mm"
        txtDatePicker.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    @objc func inviteMembers() {
        
        let vc = UINavigationController(rootViewController: InviteUsersScreen())
        
        CommonData.invitedMembers.removeAll()
        
        if let id = CommonData.partyId {
            
            for index in 0..<CommonData.listOfParties[id].invitedMembers.count {
                CommonData.invitedMembers.append(CommonData.listOfParties[id].invitedMembers[index])
            }
            
        }
        
        present(vc, animated: true, completion: nil)
        
    }
}

extension CreateNewPartyScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton(type: .custom)
        
        if let id = CommonData.partyId {
            button.setTitle("   Members (\(CommonData.listOfParties[id].invitedMembers.count))", for: .normal)
        } else {
            
            button.setTitle("   Members (0)", for: .normal)
        }
        
        button.contentHorizontalAlignment = .left
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        button.addTarget(self, action: #selector(inviteMembers), for: .touchUpInside)
        
        button.addSubview(rightArrowView)
        rightArrowView.anchor(top: button.topAnchor, leading: nil, bottom: button.bottomAnchor, trailling: button.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 5, right: 12), size: .init(width: 30, height: 0))
        
        return button
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let id = CommonData.partyId {
            return CommonData.listOfParties[id].invitedMembers.count
        }
        
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = CommonData.listOfParties[CommonData.partyId!].invitedMembers[indexPath.item].userName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            if let id = CommonData.partyId {
                CommonData.listOfParties[id].invitedMembers.remove(at: indexPath.item)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
}
