//
//  PlayerHistoryViewController.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 11/7/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class PlayerHistoryViewController: UIViewController {

    var player:ProfileList? = nil
    
    @IBOutlet weak var tblPlayerHistory: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Profile Tracking History"
        
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    


}


extension PlayerHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let player = self.player {
            return player.player_session_history.count
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let profileListCell = tableView.dequeueReusableCell(withIdentifier: "ProfileListCell") as! ProfileListCell
        if let player = self.player {
            let history = player.player_session_history[indexPath.row]
            profileListCell.lblTitle.text = "\(history.session_title) - \(history.session_date_time)"
            profileListCell.lblTitle.numberOfLines = 0
        }
        return profileListCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

