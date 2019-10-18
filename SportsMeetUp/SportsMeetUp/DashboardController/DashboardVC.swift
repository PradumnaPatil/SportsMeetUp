//
//  DashboardVC.swift
//  SportsMeetUp
//
//  Created by Shashi Kiran Kuppili on 10/16/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var soccerButton: UIButton!
    @IBOutlet weak var basketBallButton: UIButton!
    @IBOutlet weak var hokeyButton: UIButton!
    @IBOutlet weak var gymnasticsButton: UIButton!
    @IBOutlet weak var myHistoryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScreen()
    }
    
    private func setUpScreen() {
        
        self.title = "Welcome to mySTAThero"
    }
    

    @objc private func soccerButtonTapped() {
        print("button tapped")
        
    }
    @objc private func basketBallButtonTapped() {
        print("button tapped")

    }
    @objc private func hokeyButtonTapped() {
        print("button tapped")

    }
    @objc private func gymnasticsButtonTapped() {
        print("button tapped")

    }
    @objc private func myHistoryButtonTapped() {
        print("button tapped")

    }

}
