//
//  LoginViewontroller.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 10/29/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class LoginViewontroller: UIViewController {

    @IBOutlet weak var txtFieldPassword: AnimatedField!
    @IBOutlet weak var txtFieldUsername: AnimatedField!
    override func viewDidLoad() {
        super.viewDidLoad()

        txtFieldUsername.applyPropertiesToTextfield(tag: 1, isSecure: false, type: .username(4, 10), isLowercased: true, placeholder: "Username or e-mail", controller: self, keyboardType: .default)

        txtFieldPassword.applyPropertiesToTextfield(tag: 5, isSecure: true, type: .password(7, 16), isLowercased: true, placeholder: "Password", controller: self, keyboardType: .default)

        self.title = "Login"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLoginClicked(_ sender: Any) {
    }
    

}
