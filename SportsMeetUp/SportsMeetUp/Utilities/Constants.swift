//
//  Constants.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 10/14/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import Foundation


enum ComicSansMS {
    case Bold
    case Regular
    case BoldItalic
    case Italic
    
    var rawValue: String {
        switch  self {
        case .Bold: return "ComicSansMS-Bold"
        case .Regular: return "ComicSansMS"
        case .BoldItalic: return "ComicSansMS-BoldItalic"
        case .Italic: return "ComicSansMS-Italic"
        }
    }
}
