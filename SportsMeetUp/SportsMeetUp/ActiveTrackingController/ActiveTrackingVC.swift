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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    var avtiveTracking:[ActiveTracking] = [ActiveTracking(title: "Batting \n 66.66%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Bowling \n 54.50%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Fielding \n 40.33%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Wicket-Keeping \n 91.66%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Batting \n 66.66%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Bowling \n 54.50%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Fielding \n 40.33%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Wicket-Keeping \n 91.66%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Batting \n 66.66%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Bowling \n 54.50%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Fielding \n 40.33%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Wicket-Keeping \n 91.66%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Batting \n 66.66%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Bowling \n 54.50%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Fielding \n 40.33%", negativeCount: 0, positiveCount: 0), ActiveTracking(title: "Wicket-Keeping \n 91.66%", negativeCount: 0, positiveCount: 0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 700)
        contentView.layoutIfNeeded()
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
        item.negativeCount -= 1
        avtiveTracking[sender.tag] = item
        collectionViewActiveTracking.reloadData()
    }
}


