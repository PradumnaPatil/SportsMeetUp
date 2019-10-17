//
//  SetKPIViewController.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 10/14/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class SetKPIViewController: UIViewController {

    @IBOutlet weak var txtFieldSelectPosition: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        let customPickerView = CustomPickerView(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height-216, width: UIScreen.main.bounds.size.width, height: 216), pickerInputs: ["One", "Two", "Three", "Four", "Five"])
        
        self.view.addSubview(customPickerView)
        
        customPickerView.autoresizingMask = .flexibleHeight

        txtFieldSelectPosition.inputAccessoryView = customPickerView.createToolBar()
        
        // Do any additional setup after loading the view.
    }
    


}


class CustomPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var inputs = [String]()
    
    init(frame:CGRect, pickerInputs:[String]) {
        super.init(frame: frame)
        self.inputs = pickerInputs
        createPicker()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createToolBar() -> UIToolbar {
        let toolBar = UIToolbar()

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
    
    func createPicker() {
        self.dataSource = self
        self.delegate = self
    }
    
    
    
    @objc func doneButtonClicked() {
        
    }
    @objc func cancelButtonClicked() {
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return inputs.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return inputs[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}













