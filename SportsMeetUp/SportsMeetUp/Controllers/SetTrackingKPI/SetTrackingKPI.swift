//
//  SetTrackingKPI.swift
//  SportsMeetUp
//
//  Created by Shashi Kiran Kuppili on 10/17/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class SetTrackingKPI: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var statsArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statsArray = ["Statics 1","Statics 2", "Statics 3", "Statics 4"]
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        tableView.tableFooterView = UIView()
    }
  
    @IBAction func saveTeamStats(_ sender: UIButton) {
        print("save tapped")
    }
}


extension SetTrackingKPI: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = statsArray[indexPath.row]
        return cell
    }
}
