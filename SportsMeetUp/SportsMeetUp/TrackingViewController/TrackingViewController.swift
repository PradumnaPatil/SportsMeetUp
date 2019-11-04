//
//  TrackingViewController.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 10/16/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class TrackingViewController: UIViewController {

    @IBOutlet weak var lblOppositionName: UILabel!
    @IBOutlet weak var txtTimeSlot: UITextField!
    
    let arrTimeSlotArray = ["Full Game", "Phase 1", "Phase 2", "Phase 3", "Phase 4", "Phase 5"]

    let slotsPicker = UIPickerView()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        slotsPicker.delegate = self
        slotsPicker.dataSource = self
        txtTimeSlot.inputView = slotsPicker
        txtTimeSlot.inputAccessoryView = createToolBar()

        self.title = "Soccer - Tracking"
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
        txtTimeSlot.text = ""
        self.view.endEditing(true)
    }


}
extension TrackingViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrTimeSlotArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrTimeSlotArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtTimeSlot.text =  arrTimeSlotArray[row]
    }
}
