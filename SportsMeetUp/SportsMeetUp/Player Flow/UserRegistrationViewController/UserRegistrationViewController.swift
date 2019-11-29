//
//  UserRegistrationViewController.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 10/18/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class UserRegistrationViewController: UIViewController {

    @IBOutlet weak var txtFirstname: UITextField!
    @IBOutlet weak var txtLastname: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnTermsAndConditions: UIButton!
    @IBOutlet weak var btnTermsAndConditionsCheckmark: UIButton!
    @IBOutlet weak var btnNext: CustomButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.title = "User Registration"
        
    }
    
    @IBAction func btnTermsAndConditionsCheckmarkClicked(_ sender: Any) {
        btnTermsAndConditionsCheckmark.isSelected = !btnTermsAndConditionsCheckmark.isSelected
    }
    @IBAction func btnTermsAndConditionsClicked(_ sender: Any) {
        let termsAndConditionsViewController = self.storyboard?.instantiateViewController(withIdentifier: "TermsAndConditionsViewController") as! TermsAndConditionsViewController
        self.navigationController?.pushViewController(termsAndConditionsViewController, animated: true)
    }
    
    @IBAction func btnNextClicked(_ sender: Any) {
    }
}

extension UIButton {
    func alignContentVerticallyByCenter(offset:CGFloat = 10) {
        let buttonSize = self.frame.size
        
        if let titleLabel = titleLabel,
            let imageView = imageView {
            
            if let buttonTitle = titleLabel.text, let font = UIFont(name: Montserrat.Medium.rawValue, size: 15),
                let image = imageView.image {
                let titleString:NSString = NSString(string: buttonTitle)
                let titleSize = titleString.size(withAttributes: [
                    NSAttributedString.Key.font : titleLabel.font ?? font
                    ])
                let buttonImageSize = image.size
                
                let topImageOffset = (buttonSize.height - (titleSize.height + buttonImageSize.height + offset)) / 2
                let leftImageOffset = (buttonSize.width - buttonImageSize.width) / 2
                imageEdgeInsets = UIEdgeInsets(top: topImageOffset, left: leftImageOffset, bottom: 0,right: 0)
                
                let titleTopOffset = topImageOffset + offset + buttonImageSize.height
                let leftTitleOffset = (buttonSize.width - titleSize.width) / 2 - image.size.width
                
                titleEdgeInsets = UIEdgeInsets(top: titleTopOffset, left: leftTitleOffset, bottom: 0,right: 0)
            }
        }
    }
}
