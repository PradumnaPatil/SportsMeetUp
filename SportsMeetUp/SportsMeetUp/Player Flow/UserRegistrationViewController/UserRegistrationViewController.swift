//
//  UserRegistrationViewController.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 10/18/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class UserRegistrationViewController: UIViewController {

    @IBOutlet weak var txtFirstname: AnimatedField!
    @IBOutlet weak var txtLastname: AnimatedField!
    @IBOutlet weak var txtEmail: AnimatedField!
    @IBOutlet weak var txtPassword: AnimatedField!
    @IBOutlet weak var txtConfirmPassword: AnimatedField!
    
    @IBOutlet weak var btnNext: CustomButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        txtFirstname.applyPropertiesToTextfield(tag: 1, isSecure: false, type: .username(4, 10), isLowercased: true, placeholder: "Enter User first name", controller: self, keyboardType: .default)
        txtLastname.applyPropertiesToTextfield(tag: 1, isSecure: false, type: .username(4, 10), isLowercased: true, placeholder: "Enter User last name", controller: self, keyboardType: .default)
        txtEmail.applyPropertiesToTextfield(tag: 1, isSecure: false, type: .email, isLowercased: true, placeholder: "Enter User e-mail", controller: self, keyboardType: .default)
        txtPassword.applyPropertiesToTextfield(tag: 5, isSecure: true, type: .password(4, 10), isLowercased: true, placeholder: "Enter Password", controller: self, keyboardType: .default)
        txtConfirmPassword.applyPropertiesToTextfield(tag: 5, isSecure: true, type: .password(4, 10), isLowercased: true, placeholder: "Enter Confirm password", controller: self, keyboardType: .default)
        
        self.title = "Welcome to statHero"
    }
    
    @IBAction func btnNextClicked(_ sender: Any) {
    }
}
