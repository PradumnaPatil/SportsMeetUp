//
//  AddTeamProfileViewController.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 10/14/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class AddTeamProfileViewController: UIViewController {

    @IBOutlet weak var tblViewPlayerList: UITableView!
    @IBOutlet weak var txtSelectSport: AnimatedField!
    @IBOutlet weak var txtAgeGroup: AnimatedField!
    @IBOutlet weak var txtFullName: AnimatedField!
    
    let arrPlayerAge = ["2-10", "10-18", "18-26", "26-34", "34-42", "42-Above"]
    let arrSportArray = ["Football", "Cricket", "Baseball", "Basketball", "Tennis", "Badminton"]

    let agePicker = UIPickerView()
    let sportsPicker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()

        txtFullName.applyPropertiesToTextfield(tag: 0, isSecure: false, type: .username(4, 10), isLowercased: true, placeholder: "Team Full Name", controller: self, keyboardType: .default)
        
        txtAgeGroup.applyPropertiesToTextfield(tag: 1, isSecure: false, type: .price(45, 2), isLowercased: true, placeholder: "Age Group", controller: self, keyboardType: .numberPad)

        txtSelectSport.applyPropertiesToTextfield(tag: 2, isSecure: false, type: .username(4, 10), isLowercased: true, placeholder: "Enter Sport", controller: self, keyboardType: .default)

        agePicker.delegate = self
        agePicker.dataSource = self
        txtAgeGroup.pickerView(agePicker, didSelectRow: 0, inComponent: 0)
        //txtAgeGroup.inputView = agePicker
        //txtAgeGroup.inputAccessoryView = createToolBar()
        
        sportsPicker.delegate = self
        sportsPicker.dataSource = self
        txtSelectSport.pickerView(sportsPicker, didSelectRow: 0, inComponent: 0)
        //txtSelectSport.inputView = sportsPicker
        //txtSelectSport.inputAccessoryView = createToolBar()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnNextClicked(_ sender: Any) {
        if let controllers = self.navigationController?.viewControllers {
            for controller in controllers {
                if controller is ViewController {
                    self.navigationController?.popToViewController(controller, animated: true)
                    break
                }
            }
        }
    }
}

extension AddTeamProfileViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myTeamsCustomCell = tableView.dequeueReusableCell(withIdentifier: "MyTeamsCustomCell") as! MyTeamsCustomCell
        myTeamsCustomCell.lblTeamTitle.text = "Player \(indexPath.row+1)"
        return myTeamsCustomCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}



extension AddTeamProfileViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == agePicker {
            return arrPlayerAge.count
        } else if pickerView == sportsPicker {
            return arrSportArray.count
        } else {
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == agePicker {
            return arrPlayerAge[row]
        } else if pickerView == sportsPicker {
            return arrSportArray[row]
        } else {
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == agePicker {
            txtAgeGroup.text =  arrPlayerAge[row]
        } else if pickerView == sportsPicker {
            txtSelectSport.text =  arrSportArray[row]
        }
    }
}
