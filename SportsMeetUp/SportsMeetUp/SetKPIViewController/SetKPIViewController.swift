//
//  SetKPIViewController.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 10/14/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

struct Statistics {
    
    var title:String
    var isSelected:Bool
}


class SetKPIViewController: UIViewController {

    
    @IBOutlet weak var tblViewStatistics: UITableView!
    @IBOutlet weak var txtFieldSelectPosition: UITextField!
    @IBOutlet weak var txtFieldSelectSport: UITextField!
    @IBOutlet weak var txtFieldSelectPlayer: UITextField!
    let arrPositionArray = ["Goalkeeper", "Full-backs", "Centre-Backs", "Sweeper", "Central Midfield", "Wide Midfield", "Striker", "Behind the Striker"]
    let arrPlayerArray = ["David Beckham", "Reggie Bush", "Tony Romo", "Diego Maradona", "Wayne Rooney", "Vyacheslav Malafeev", "Ian Roberts", "Justin Fashanu", "Zinedine Zidane", "Luís Figo", "Paris Jackson"]
    let arrSportArray = ["Football", "Cricket", "Baseball", "Basketball", "Tennis", "Badminton"]
    var arrStatistics:[Statistics] = [Statistics(title: "Statistics1", isSelected: false), Statistics(title: "Statistics2", isSelected: false), Statistics(title: "Statistics3", isSelected: false), Statistics(title: "Statistics4", isSelected: false), Statistics(title: "Statistics5", isSelected: false)]//["Statistics1", "Statistics2", "Statistics3", "Statistics4", "Statistics5", "Statistics6", "Statistics7", "Statistics8", "Statistics9", "Statistics10", ]

    
    let positionPicker = UIPickerView()
    let playerPicker = UIPickerView()
    let sportsPicker = UIPickerView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        positionPicker.delegate = self
        positionPicker.dataSource = self
        txtFieldSelectPosition.inputView = positionPicker
        txtFieldSelectPosition.inputAccessoryView = createToolBar()
        
        sportsPicker.delegate = self
        sportsPicker.dataSource = self
        txtFieldSelectSport.inputView = sportsPicker
        txtFieldSelectSport.inputAccessoryView = createToolBar()
        
        playerPicker.delegate = self
        playerPicker.dataSource = self
        txtFieldSelectPlayer.inputView = playerPicker
        txtFieldSelectPlayer.inputAccessoryView = createToolBar()
        
        self.title = "Set Tracking KPI's"
        // Do any additional setup after loading the view.
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
        cancelButton.titleLabel?.font = UIFont(name: Montserrat.Medium.rawValue, size: 14)
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        cancelButton.titleLabel?.font = UIFont(name: Montserrat.Medium.rawValue, size: 13)
        let leftItem = UIBarButtonItem(customView: cancelButton)
        
        let doneButton = UIButton()
        doneButton.sizeToFit()
        doneButton.setTitleColor(.black, for: .normal)
        doneButton.titleLabel?.font = UIFont(name: Montserrat.Medium.rawValue, size: 14)
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
        doneButton.titleLabel?.font = UIFont(name: Montserrat.Medium.rawValue, size: 13)
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
        txtFieldSelectPosition.text = ""
        self.view.endEditing(true)
    }

}

extension SetKPIViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == positionPicker {
            return arrPositionArray.count
        } else if pickerView == sportsPicker {
            return arrSportArray.count
        } else if pickerView == playerPicker {
            return arrPlayerArray.count
        } else {
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == positionPicker {
            return arrPositionArray[row]
        } else if pickerView == sportsPicker {
            return arrSportArray[row]
        } else if pickerView == playerPicker {
            return arrPlayerArray[row]
        } else {
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == positionPicker {
            txtFieldSelectPosition.text =  arrPositionArray[row]
        } else if pickerView == sportsPicker {
            txtFieldSelectSport.text =  arrSportArray[row]
        } else if pickerView == playerPicker {
            txtFieldSelectPlayer.text =  arrPlayerArray[row]
        }
    }
}
extension SetKPIViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStatistics.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myTeamsCustomCell = tableView.dequeueReusableCell(withIdentifier: "MyTeamsCustomCell") as! MyTeamsCustomCell
        let statistics = arrStatistics[indexPath.row]
        myTeamsCustomCell.lblTeamTitle.text = "\(statistics.title)"
        myTeamsCustomCell.btnCheckmark.isSelected = statistics.isSelected
        return myTeamsCustomCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        arrStatistics[indexPath.row].isSelected = !arrStatistics[indexPath.row].isSelected
        tblViewStatistics.reloadData()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}













