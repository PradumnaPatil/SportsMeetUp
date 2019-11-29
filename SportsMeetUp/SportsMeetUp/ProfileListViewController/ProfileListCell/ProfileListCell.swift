//
//  ProfileListCell.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 11/5/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

class ProfileListCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnHistory: CustomButton!
    @IBOutlet weak var btnNewSession: CustomButton!
    @IBOutlet weak var customView: CustomView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
