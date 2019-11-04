//
//  GameViewController.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 10/29/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var segmentView: UISegmentedControl!
    @IBOutlet weak var tblViewMatches: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentIndexChanged(_ sender: Any) {
        tblViewMatches.reloadData()
    }
    
}

extension GameViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myTeamsCustomCell = tableView.dequeueReusableCell(withIdentifier: "MyTeamsCustomCell") as! MyTeamsCustomCell
        myTeamsCustomCell.lblTeamTitle.text = segmentView.selectedSegmentIndex == 0 ? "Upcoming Match \(indexPath.row + 1)" : "Past Match \(indexPath.row + 1)"
        return myTeamsCustomCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
