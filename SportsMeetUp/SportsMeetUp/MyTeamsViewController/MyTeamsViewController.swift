//
//  MyTeamsViewController.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 10/14/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class MyTeamsViewController: UIViewController {

    @IBOutlet weak var tblViewTeams: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Teams"
        
        addTeamButton()
        // Do any additional setup after loading the view.
    }
    
    func addTeamButton() {
        let longTitleLabel = UIButton()
        longTitleLabel.sizeToFit()
        longTitleLabel.setTitleColor(.black, for: .normal)
        longTitleLabel.setTitle("Add Team", for: .normal)
        longTitleLabel.addTarget(self, action: #selector(btnAddTeamClicked), for: .touchUpInside)
        longTitleLabel.titleLabel?.font = UIFont(name: ComicSansMS.Regular.rawValue, size: 13)
        let rightItem = UIBarButtonItem(customView: longTitleLabel)
        self.navigationItem.rightBarButtonItem = rightItem
    }
    @objc func btnAddTeamClicked() {
        
    }
}

extension MyTeamsViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myTeamsCustomCell = tableView.dequeueReusableCell(withIdentifier: "MyTeamsCustomCell") as! MyTeamsCustomCell
        myTeamsCustomCell.lblTeamTitle.text = "Team \(indexPath.row+1) Name"
        return myTeamsCustomCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
