//
//  Constants.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 10/14/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import Foundation
import UIKit


enum Montserrat {
    case Bold
    case Regular
    case BoldItalic
    case Italic
    case Medium

    var rawValue: String {
        switch  self {
        case .Bold: return "Montserrat-Bold"
        case .Regular: return "Montserrat-Regular"
        case .BoldItalic: return "Montserrat-BoldItalic"
        case .Italic: return "Montserrat-Italic"
        case .Medium: return "Montserrat-Medium"
        }
    }
}


enum Storyboards {
    case Coach
    var rawValue: UIStoryboard {
        switch  self {
        case .Coach: return UIStoryboard(name: "Coach", bundle: nil)
        }
    }
}
