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

@IBDesignable
class CustomTextField: UITextField {
    
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
    
    @IBInspectable var applyPadding: Bool = false

    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    let no_padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        let boundss = bounds.inset(by: applyPadding ? padding : no_padding)
        return boundss
    }
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let boundss = bounds.inset(by: applyPadding ? padding : no_padding)
        return boundss
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        let boundss = bounds.inset(by: applyPadding ? padding : no_padding)
        return boundss
    }
}

@IBDesignable
class CustomLabel: UILabel {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = CGFloat(cornerRadius)
            layer.masksToBounds = true
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
