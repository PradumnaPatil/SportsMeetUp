//
//  IBDesignables.swift
//  SportsMeetUp
//
//  Created by Pradumna Patil on 9/20/19.
//  Copyright © 2019 Quest-Global. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 1 {
        didSet {
            layer.cornerRadius = CGFloat(cornerRadius)
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = CGFloat(borderWidth)
        }
    }
    
    @IBInspectable var borderColor: UIColor = .white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
}

@IBDesignable
class CustomView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 1 {
        didSet {
            layer.cornerRadius = CGFloat(cornerRadius)
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = CGFloat(borderWidth)
        }
    }
    
    @IBInspectable var borderColor: UIColor = .white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
}
