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
        self.navigationController?.navigationBar.backgroundColor = .blue
        
        questionLabel.text = "Pick a sport to start tracking"
        questionLabel.numberOfLines = 0
        questionLabel.font = UIFont(name: ComicSansMS.Bold.rawValue, size: 30)
        
        soccerButton.setTitle("Soccer", for: .normal)
        soccerButton.backgroundColor = .blue
        soccerButton.layer.borderColor = UIColor.black.cgColor
        soccerButton.sizeToFit()
        soccerButton.titleLabel?.font = UIFont(name: ComicSansMS.Regular.rawValue, size: 20)
        soccerButton.setTitleColor(.white, for: .normal)
        soccerButton.addTarget(self, action: #selector(soccerButtonTapped), for: .touchUpInside)
        
        basketBallButton.setTitle("BasketBall", for: .normal)
        basketBallButton.backgroundColor = .blue
        basketBallButton.layer.borderColor = UIColor.black.cgColor
        basketBallButton.sizeToFit()
        basketBallButton.titleLabel?.font = UIFont(name: ComicSansMS.Regular.rawValue, size: 20)
        basketBallButton.setTitleColor(.white, for: .normal)
        basketBallButton.addTarget(self, action: #selector(basketBallButtonTapped), for: .touchUpInside)
        
        hokeyButton.setTitle("Hokey", for: .normal)
        hokeyButton.backgroundColor = .blue
        hokeyButton.layer.borderColor = UIColor.black.cgColor
        hokeyButton.sizeToFit()
        hokeyButton.titleLabel?.font = UIFont(name: ComicSansMS.Regular.rawValue, size: 20)
        hokeyButton.setTitleColor(.white, for: .normal)
        hokeyButton.addTarget(self, action: #selector(hokeyButtonTapped), for: .touchUpInside)

        gymnasticsButton.setTitle("Gymnastics", for: .normal)
        gymnasticsButton.backgroundColor = .blue
        gymnasticsButton.layer.borderColor = UIColor.black.cgColor
        gymnasticsButton.sizeToFit()
        gymnasticsButton.titleLabel?.font = UIFont(name: ComicSansMS.Regular.rawValue, size: 20)
        gymnasticsButton.setTitleColor(.white, for: .normal)
        gymnasticsButton.addTarget(self, action: #selector(gymnasticsButtonTapped), for: .touchUpInside)

        myHistoryButton.setTitle("My History", for: .normal)
        myHistoryButton.backgroundColor = .blue
        myHistoryButton.layer.borderColor = UIColor.black.cgColor
        myHistoryButton.sizeToFit()
        myHistoryButton.titleLabel?.font = UIFont(name: ComicSansMS.Regular.rawValue, size: 20)
        myHistoryButton.setTitleColor(.white, for: .normal)
        myHistoryButton.addTarget(self, action: #selector(myHistoryButtonTapped), for: .touchUpInside)
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
