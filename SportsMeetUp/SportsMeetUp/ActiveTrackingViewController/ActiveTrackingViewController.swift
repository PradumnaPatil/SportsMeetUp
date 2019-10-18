//
//  ActiveTrackingViewController.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 10/16/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class ActiveTrackingViewController: UIViewController {
    @IBOutlet weak var tblViewStatistics: UITableView!
    @IBOutlet weak var btnEndTracking: UIButton!
    @IBOutlet weak var btnStartTracking: UIButton!
    @IBOutlet weak var lblTimerTracking: UILabel!
    @IBOutlet weak var lblPlayerName: UILabel!
    @IBOutlet weak var lblPosition: UILabel!
    @IBOutlet weak var txtFieldPlayerPosition: UITextField!
    @IBOutlet weak var lblTimer: CustomLabel!
    
    var passesArray = ["Passes Completion", "Incomplete Passes", "Shots on Target", "Successful Dribbles", "Position Lost"]
    let arrPositionArray = ["Goalkeeper", "Full-backs", "Centre-Backs", "Sweeper", "Central Midfield", "Wide Midfield", "Striker", "Behind the Striker"]
    var timer:Timer? = nil
    var timeInSeconds = 0
    
    let positionPicker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()

        positionPicker.delegate = self
        positionPicker.dataSource = self
        txtFieldPlayerPosition.inputView = positionPicker
        txtFieldPlayerPosition.inputAccessoryView = createToolBar()

        
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
        txtFieldPlayerPosition.text = ""
        self.view.endEditing(true)
    }

    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    @IBAction func btnStartClicked(_ sender: Any) {
        
        if btnStartTracking.titleLabel?.text == "START" {
            btnStartTracking.setTitle("PAUSE", for: .normal)
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                self.timeInSeconds += 1
                DispatchQueue.main.async {
                    self.lblTimer.text = self.timeFormatted(self.timeInSeconds)
                }
            }
        } else {
            btnStartTracking.setTitle("START", for: .normal)
            if let timer = self.timer {
                if timer.isValid {
                    timer.invalidate()
                }
            }
        }
    }
    @IBAction func btnEndGameTrackingClicked(_ sender: Any) {
        if let controllers = self.navigationController?.viewControllers {
            for controller in controllers {
                if controller is DashboardVC {
                    self.navigationController?.popToViewController(controller, animated: true)
                    break
                }
            }
        }
    }
}

extension ActiveTrackingViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passesArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myTeamsCustomCell = tableView.dequeueReusableCell(withIdentifier: "MyTeamsCustomCell") as! MyTeamsCustomCell
        myTeamsCustomCell.lblTeamTitle.text = "\(passesArray[indexPath.row])"
        return myTeamsCustomCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}


extension ActiveTrackingViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == positionPicker {
            return arrPositionArray.count
        } else {
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == positionPicker {
            return arrPositionArray[row]
        } else {
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == positionPicker {
            txtFieldPlayerPosition.text =  arrPositionArray[row]
        }
    }
}
