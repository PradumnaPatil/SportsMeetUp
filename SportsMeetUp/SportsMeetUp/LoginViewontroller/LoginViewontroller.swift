//
//  LoginViewontroller.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 10/29/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class LoginViewontroller: UIViewController {

    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var txtFieldUsername: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()



        self.title = "Login"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLoginClicked(_ sender: Any) {
    }
    

}
