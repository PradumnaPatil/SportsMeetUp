//
//  AddPlayerController.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 10/18/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class AddPlayerController: UIViewController {

    @IBOutlet weak var txtPlayerFullName: UITextField!
    @IBOutlet weak var txtPlayerAge: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    
    let agePicker = UIPickerView()
    var ageArray:[Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1975...2019 {
            ageArray.append(i)
        }
        
        agePicker.delegate = self
        agePicker.dataSource = self
        txtPlayerAge.inputView = agePicker
        txtPlayerAge.inputAccessoryView = createToolBar()

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
        txtPlayerAge.text = ""
        self.view.endEditing(true)
    }
}

extension AddPlayerController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(ageArray[row])"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtPlayerAge.text =  "\(ageArray[row])"
    }
}



