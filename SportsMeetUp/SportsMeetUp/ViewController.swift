//
//  ViewController.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 9/19/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtFirstName: AnimatedField!
    @IBOutlet weak var txtLastName: AnimatedField!
    @IBOutlet weak var txtEmail: AnimatedField!
    @IBOutlet weak var txtPassword: AnimatedField!
    @IBOutlet weak var txtConfirmPassword: AnimatedField!
    @IBOutlet weak var txtClubName: AnimatedField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFirstName.applyPropertiesToTextfield(tag: 1, isSecure: false, type: .username(4, 10), isLowercased: true, placeholder: "Coach firstname", controller: self, keyboardType: .default)
        txtLastName.applyPropertiesToTextfield(tag: 2, isSecure: false, type: .username(4, 10), isLowercased: true, placeholder: "Coach lastname", controller: self, keyboardType: .default)
        txtEmail.applyPropertiesToTextfield(tag: 3, isSecure: false, type: .email, isLowercased: true, placeholder: "Coach Email", controller: self, keyboardType: .default)
        txtPassword.applyPropertiesToTextfield(tag: 4, isSecure: true, type: .password(4, 10), isLowercased: true, placeholder: "Password", controller: self, keyboardType: .default)
        txtConfirmPassword.applyPropertiesToTextfield(tag: 5, isSecure: true, type: .password(4, 10), isLowercased: true, placeholder: "Confirm password", controller: self, keyboardType: .default)
        txtClubName.applyPropertiesToTextfield(tag: 2, isSecure: false, type: .username(4, 10), isLowercased: true, placeholder: "Club Name", controller: self, keyboardType: .default)

        
        
        // Do any additional setup after loading the view.
    }


}

extension AnimatedField {
    func applyPropertiesToTextfield(tag:Int, isSecure:Bool, type:AnimatedFieldType, isLowercased:Bool, placeholder:String, controller:UIViewController, keyboardType:UIKeyboardType) {
        
        var format = AnimatedFieldFormat()
        format.titleFont = UIFont(name: ComicSansMS.Regular.rawValue, size: 14)!
        format.textFont = UIFont(name: ComicSansMS.Regular.rawValue, size: 16)!
        format.alertColor = .red
        format.alertFieldActive = false
        format.titleAlwaysVisible = true
        format.alertFont = UIFont(name: ComicSansMS.Regular.rawValue, size: 16)!
        
        self.format = format
        self.placeholder = placeholder
        self.dataSource = controller as? AnimatedFieldDataSource
        self.delegate = controller as? AnimatedFieldDelegate
        self.lowercased = isLowercased
        self.type = type
        self.secureField(isSecure)
        self.keyboardType = keyboardType
        self.tag = tag
    }
}

extension ViewController: AnimatedFieldDelegate {
    
}
extension ViewController: AnimatedFieldDataSource {
    func animatedFieldValidationError(_ animatedField: AnimatedField) -> String? {
        if animatedField == txtEmail {
            return "Email invalid! Please check again ;)"
        }
        return nil
    }
}
