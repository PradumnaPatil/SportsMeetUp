//
//  SoccerVC.swift
//  SportsMeetUp
//
//  Created by Shashi Kiran Kuppili on 10/16/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class SoccerVC: UIViewController {

    @IBOutlet weak var txtFieldSelectPlayer: CustomTextField!
    @IBOutlet weak var txtFieldSelectPosition: CustomTextField!
    @IBOutlet weak var txtFieldSelectFormation: CustomTextField!
    @IBOutlet weak var txtFieldSelectOppositionTeam: CustomTextField!

    
    let arrPositionArray = ["Goalkeeper", "Full-backs", "Centre-Backs", "Sweeper", "Central Midfield", "Wide Midfield", "Striker", "Behind the Striker"]
    let arrPlayerArray = ["David Beckham", "Reggie Bush", "Tony Romo", "Diego Maradona", "Wayne Rooney", "Vyacheslav Malafeev", "Ian Roberts", "Justin Fashanu", "Zinedine Zidane", "Luís Figo", "Paris Jackson"]
    let arrFormationArray = ["Football", "Cricket", "Baseball", "Basketball", "Tennis", "Badminton"]
    let arrTeamArray = ["Team1", "Team2", "Team3", "Team4", "Team5", "Team6", "Team7", "Team8", "Team9", "Team10", ]

    
    let playerPicker = UIPickerView()
    let positionPicker = UIPickerView()
    let formationPicker = UIPickerView()
    let teamPicker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerPicker.delegate = self
        playerPicker.dataSource = self
        txtFieldSelectPlayer.inputView = playerPicker
        txtFieldSelectPlayer.inputAccessoryView = createToolBar()
        
        positionPicker.delegate = self
        positionPicker.dataSource = self
        txtFieldSelectPosition.inputView = positionPicker
        txtFieldSelectPosition.inputAccessoryView = createToolBar()
        
        formationPicker.delegate = self
        formationPicker.dataSource = self
        txtFieldSelectFormation.inputView = formationPicker
        txtFieldSelectFormation.inputAccessoryView = createToolBar()

        teamPicker.delegate = self
        teamPicker.dataSource = self
        txtFieldSelectOppositionTeam.inputView = teamPicker
        txtFieldSelectOppositionTeam.inputAccessoryView = createToolBar()
    }
    
    
    private func setUpScreens() {
        
    }
    @IBAction func trackingButton(_ sender: UIButton) {
    }
    
    func createToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        toolBar.isUserInteractionEnabled = true
        
        let cancelButton = UIButton()
        cancelButton.sizeToFit()
        cancelButton.titleLabel?.font = UIFont(name: ComicSansMS.Regular.rawValue, size: 14)
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        cancelButton.titleLabel?.font = UIFont(name: ComicSansMS.Regular.rawValue, size: 13)
        let leftItem = UIBarButtonItem(customView: cancelButton)
        
        let doneButton = UIButton()
        doneButton.sizeToFit()
        doneButton.setTitleColor(.black, for: .normal)
        doneButton.titleLabel?.font = UIFont(name: ComicSansMS.Regular.rawValue, size: 14)
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
        doneButton.titleLabel?.font = UIFont(name: ComicSansMS.Regular.rawValue, size: 13)
        let rightItem = UIBarButtonItem(customView: doneButton)
        
        var items = [UIBarButtonItem]()
        items.append(leftItem)
        items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))
        items.append(rightItem)
        toolBar.setItems(items, animated: true)
        
        return toolBar
    }
    
    @objc func doneButtonClicked() {
        self.view.endEditing(true)
    }
    @objc func cancelButtonClicked() {
        //txtFieldSelectPosition.text = ""
        self.view.endEditing(true)
    }

}
/*
 let playerPicker = UIPickerView()
 let positionPicker = UIPickerView()
 let formationPicker = UIPickerView()
 let teamPicker = UIPickerView()

 
 */

extension SoccerVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == playerPicker {
            return arrPlayerArray.count
        } else if pickerView == positionPicker {
            return arrPositionArray.count
        } else if pickerView == formationPicker {
            return arrFormationArray.count
        } else if pickerView == teamPicker {
            return arrTeamArray.count
        } else {
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == playerPicker {
            return arrPlayerArray[row]
        } else if pickerView == positionPicker {
            return arrPositionArray[row]
        } else if pickerView == formationPicker {
            return arrFormationArray[row]
        } else if pickerView == teamPicker {
            return arrTeamArray[row]
        } else {
            return ""
        }

    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == playerPicker {
            txtFieldSelectPlayer.text =  arrPlayerArray[row]
        } else if pickerView == positionPicker {
            txtFieldSelectPosition.text =  arrPositionArray[row]
        } else if pickerView == formationPicker {
            txtFieldSelectFormation.text =  arrFormationArray[row]
        } else if pickerView == teamPicker {
            txtFieldSelectOppositionTeam.text =  arrTeamArray[row]
        }
    }
}
