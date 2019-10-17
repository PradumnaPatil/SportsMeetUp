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
    override func viewDidLoad() {
        super.viewDidLoad()

        txtFullName.applyPropertiesToTextfield(tag: 0, isSecure: false, type: .username(4, 10), isLowercased: true, placeholder: "Team Full Name", controller: self, keyboardType: .default)
        
        txtAgeGroup.applyPropertiesToTextfield(tag: 1, isSecure: false, type: .username(4, 10), isLowercased: true, placeholder: "Age Group", controller: self, keyboardType: .numberPad)

        txtSelectSport.applyPropertiesToTextfield(tag: 2, isSecure: false, type: .username(4, 10), isLowercased: true, placeholder: "Select Sport", controller: self, keyboardType: .default)

        
        // Do any additional setup after loading the view.
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
