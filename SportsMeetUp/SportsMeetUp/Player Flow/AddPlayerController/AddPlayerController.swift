//
//  AddPlayerController.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 10/18/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class AddPlayerController: UIViewController {

    @IBOutlet weak var txtPlayerFullName: AnimatedField!
    @IBOutlet weak var txtPlayerAge: AnimatedField!
    @IBOutlet weak var txtTeamName: AnimatedField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtPlayerFullName.applyPropertiesToTextfield(tag: 0, isSecure: false, type: .username(4, 10), isLowercased: true, placeholder: "Player Full Name", controller: self, keyboardType: .default)
        txtPlayerAge.applyPropertiesToTextfield(tag: 1, isSecure: false, type: .email, isLowercased: true, placeholder: "Email Address", controller: self, keyboardType: .default)
        txtTeamName.applyPropertiesToTextfield(tag: 2, isSecure: false, type: .username(4, 10), isLowercased: true, placeholder: "Phone Number", controller: self, keyboardType: .phonePad)

        // Do any additional setup after loading the view.
    }
    

}
