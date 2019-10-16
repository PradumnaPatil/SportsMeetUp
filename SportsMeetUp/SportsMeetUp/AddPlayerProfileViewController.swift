//
//  AddPlayerProfileViewController.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 9/20/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class AddPlayerProfileViewController: UIViewController {

    @IBOutlet weak var txtPlayerFullNmae: AnimatedField!
    @IBOutlet weak var txtPlayerAge: AnimatedField!
    @IBOutlet weak var txtTeamName: AnimatedField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtPlayerFullNmae.applyPropertiesToTextfield(tag: 0, isSecure: false, type: .username(4, 10), isLowercased: true, placeholder: "Player Full Name", controller: self, keyboardType: .default)
        txtPlayerAge.applyPropertiesToTextfield(tag: 1, isSecure: false, type: .email, isLowercased: true, placeholder: "Email Address", controller: self, keyboardType: .default)
        txtTeamName.applyPropertiesToTextfield(tag: 2, isSecure: false, type: .username(4, 10), isLowercased: true, placeholder: "Phone Number", controller: self, keyboardType: .phonePad)
        
        // Do any additional setup after loading the view.
    }
}

extension AddPlayerProfileViewController: AnimatedFieldDelegate {
    
}
extension AddPlayerProfileViewController: AnimatedFieldDataSource {

}
