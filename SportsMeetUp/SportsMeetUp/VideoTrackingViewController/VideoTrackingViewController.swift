//
//  VideoTrackingViewController.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 11/19/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class VideoTrackingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addSaveTrackingButton()

    }
    

    func addSaveTrackingButton() {
        let longTitleLabel = UIButton()
        longTitleLabel.sizeToFit()
        longTitleLabel.setTitleColor(.black, for: .normal)
        longTitleLabel.setTitle("Save Tracking Session", for: .normal)
        longTitleLabel.addTarget(self, action: #selector(routeMapsClicked), for: .touchUpInside)
        let rightItem = UIBarButtonItem(customView: longTitleLabel)
        self.navigationItem.rightBarButtonItem = rightItem
    }
    @objc func routeMapsClicked() {
        let trackingViewController = self.storyboard?.instantiateViewController(withIdentifier: "TrackingViewController") as! TrackingViewController
        self.navigationController?.pushViewController(trackingViewController, animated: true)
    }

}
