//
//  ActiveTrackingCollectionCell.swift
//  SportsMeetUp
//
//  Created by Shashi Kiran Kuppili on 11/4/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class ActiveTrackingCollectionCell: UICollectionViewCell {
    @IBOutlet weak var lblActivityName: UILabel!
    @IBOutlet weak var btnNegative: CustomButton!
    @IBOutlet weak var btnPositive: CustomButton!
    
    
    
    func updateCell(using item:ActiveTracking) {
        self.lblActivityName.text = item.title
        self.btnNegative.setTitle("\(item.negativeCount)", for: .normal)
        self.btnPositive.setTitle("\(item.positiveCount)", for: .normal)
    }
    
    
}
