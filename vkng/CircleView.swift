//
//  CircleView.swift
//  vkng
//
//  Created by Serg on 18.03.2021.
//

import UIKit

@IBDesignable class CircleView: UIView {
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 4 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    @IBInspectable var shadowOffset: CGSize = .zero {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    @IBInspectable var cornerRadius: Int = 25 {
        didSet {
            layer.cornerRadius = CGFloat(cornerRadius)
        }
    }
     
}
