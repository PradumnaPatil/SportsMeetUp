//
//  ProfileListViewController.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 11/5/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

enum ProfileType {
    case Individual
    case Coach
    
}
struct ProfileList {
    var title:String
    var profile_type:ProfileType
    var player_session_history:[PlayerSessions]
}

struct PlayerSessions {
    var session_title:String
    var session_date_time:String
}


class ProfileListViewController: UIViewController {

    var profileArr:[ProfileList] = [
        ProfileList(title: "Avinash Mujumdar - Soccer", profile_type: .Individual, player_session_history: [PlayerSessions(session_title: "Session 1", session_date_time: "14/11/2019 11:12 AM"), PlayerSessions(session_title: "Session 2", session_date_time: "14/11/2019 09:21 AM"), PlayerSessions(session_title: "Session 3", session_date_time: "14/11/2019 08:56 PM")]),
        
        ProfileList(title: "Avinash Mujumdar - Cricket", profile_type: .Individual, player_session_history: [PlayerSessions(session_title: "Session 4", session_date_time: "12/09/2019 11:12 AM"), PlayerSessions(session_title: "Session 5", session_date_time: "12/09/2019 09:21 AM"), PlayerSessions(session_title: "Session 6", session_date_time: "12/09/2019 08:56 PM")]),
        
        ProfileList(title: "Avinash Mujumdar - (Club) Soccer FC", profile_type: .Coach, player_session_history: [])
    ]
    @IBOutlet weak var tblViewProfileList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        addMapsButton()
        
        // Do any additional setup after loading the view.
    }
    
    func addMapsButton() {
        let longTitleLabel = UIButton()
        longTitleLabel.sizeToFit()
        longTitleLabel.setTitleColor(.black, for: .normal)
        longTitleLabel.setTitle("Add", for: .normal)
        longTitleLabel.addTarget(self, action: #selector(routeMapsClicked), for: .touchUpInside)
        let rightItem = UIBarButtonItem(customView: longTitleLabel)
        self.navigationItem.rightBarButtonItem = rightItem
    }

    @objc func routeMapsClicked() {
        let addPlayerController = self.storyboard?.instantiateViewController(withIdentifier: "AddPlayerController") as! AddPlayerController
        self.navigationController?.pushViewController(addPlayerController, animated: true)
    }

}
extension ProfileListViewController:UITableViewDelegate, UITableViewDataSource {
    
    @objc func btnHistoryClicked(sender:UIButton) {
        let profile = profileArr[sender.tag]        
        let playerHistoryViewController = self.storyboard?.instantiateViewController(withIdentifier: "PlayerHistoryViewController") as! PlayerHistoryViewController
        playerHistoryViewController.player = profile
        self.navigationController?.pushViewController(playerHistoryViewController, animated: true)
    }
    @objc func btnNewSessionClicked(sender:UIButton) {
        let profile = profileArr[sender.tag]
        if profile.profile_type == .Individual {
            let soccerVC = self.storyboard?.instantiateViewController(withIdentifier: "SoccerVC") as! SoccerVC
            self.navigationController?.pushViewController(soccerVC, animated: true)
        } else {
            let gameViewController = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
            self.navigationController?.pushViewController(gameViewController, animated: true)
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let profileListCell = tableView.dequeueReusableCell(withIdentifier: "ProfileListCell") as! ProfileListCell
        let profile = profileArr[indexPath.row]
        profileListCell.lblTitle.text = profile.title
        if profile.profile_type == .Individual {
            profileListCell.customView.backgroundColor = .clear
        }
        else {
            profileListCell.customView.backgroundColor = .lightGray
        }
        profileListCell.btnHistory.addTarget(self, action: #selector(btnHistoryClicked), for: .touchUpInside)
        profileListCell.btnNewSession.addTarget(self, action: #selector(btnNewSessionClicked), for: .touchUpInside)
        
        profileListCell.btnNewSession.tag = indexPath.row
        profileListCell.btnHistory.tag = indexPath.row
        
        return profileListCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        let profile = profileArr[indexPath.row]
        if profile.profile_type == .Individual {
            return true
        }
        else {
            return false
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            profileArr.remove(at: indexPath.row)
            tblViewProfileList.reloadData()
        }
    }
}
