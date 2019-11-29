//
//  ActiveTrackingVC.swift
//  SportsMeetUp
//
//  Created by Shashi Kiran Kuppili on 11/4/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

struct ActiveTracking {
    
    var title:String
    var negativeCount:Int
    var positiveCount:Int
    
}


class ActiveTrackingVC: UIViewController {

    @IBOutlet weak var collectionViewActiveTracking: UICollectionView!
    @IBOutlet weak var txtFieldSelectPosition: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    let positionPicker = UIPickerView()

    let arrPositionArray = ["Goalkeeper", "Full-backs", "Centre-Backs", "Sweeper", "Central Midfield", "Wide Midfield", "Striker", "Behind the Striker"]

    var avtiveTracking:[ActiveTracking] = [ActiveTracking(title: "Batting \n 66.66%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Bowling \n 54.50%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Fielding \n 40.33%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Wicket-Keeping \n 91.66%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Batting \n 66.66%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Bowling \n 54.50%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Fielding \n 40.33%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Wicket-Keeping \n 91.66%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Batting \n 66.66%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Bowling \n 54.50%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Fielding \n 40.33%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Wicket-Keeping \n 91.66%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Batting \n 66.66%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Bowling \n 54.50%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Fielding \n 40.33%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Wicket-Keeping \n 91.66%", negativeCount: 0, positiveCount: 0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        positionPicker.delegate = self
        positionPicker.dataSource = self
        txtFieldSelectPosition.inputView = positionPicker
        txtFieldSelectPosition.inputAccessoryView = createToolBar()

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
extension ActiveTrackingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avtiveTracking.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActiveTrackingCollectionCell", for: indexPath) as! ActiveTrackingCollectionCell
        cell.layer.cornerRadius = 10
        let item = avtiveTracking[indexPath.row]
        cell.updateCell(using: item)
        cell.btnPositive.addTarget(self, action: #selector(btnPositiveClicked), for: .touchUpInside)
        cell.btnNegative.addTarget(self, action: #selector(btnNegativeClicked), for: .touchUpInside)
        cell.btnPositive.tag = indexPath.row
        cell.btnNegative.tag = indexPath.row
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width-5, height: collectionView.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    @objc func btnPositiveClicked(sender:UIButton) {
        var item = avtiveTracking[sender.tag]
        item.positiveCount += 1
        avtiveTracking[sender.tag] = item
        collectionViewActiveTracking.reloadData()
    }
    @objc func btnNegativeClicked(sender:UIButton) {
        var item = avtiveTracking[sender.tag]
        item.negativeCount += 1
        avtiveTracking[sender.tag] = item
        collectionViewActiveTracking.reloadData()
    }
}


extension ActiveTrackingVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrPositionArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrPositionArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtFieldSelectPosition.text =  arrPositionArray[row]
    }
}
