//
//  RoundView.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//

import UIKit

protocol RoundViewProtocol {
    
    var radius: CGFloat { get set }
    
    func setRadius(corner: Double)
    func rounded(corner: Double)
    func circle()
}

protocol RoundImageProtocol {
    
    var radius: CGFloat { get set }
    
    func setRadius(corner: Double)
    func rounded(corner: Double)
    func circle()
}

@IBDesignable
class RoundView: UIView, RoundViewProtocol {
    
    @IBInspectable
    var radius: CGFloat = 0.0 {
        didSet {
            setRadius(corner: Double(radius))
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        set {
            layer.borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.black.cgColor)
        }
    }
}

@IBDesignable
class RoundLabel: UILabel, RoundViewProtocol {
    
    @IBInspectable
    var radius: CGFloat = 0.0 {
        didSet {
            setRadius(corner: Double(radius))
        }
    }
    
    @IBInspectable
    var lineWidth: CGFloat  {
        get{
            return self.layer.borderWidth
        }
        set{
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor {
        get{
            return UIColor(cgColor: self.layer.borderColor ?? UIColor.black.cgColor)
        }
        set{
            self.layer.borderColor = newValue.cgColor
        }
    }
}

@IBDesignable
class RoundButton: UIButton, RoundViewProtocol {
    
    @IBInspectable
    var radius: CGFloat = 0.0 {
        didSet {
            setRadius(corner: Double(radius))
        }
    }
    
    @IBInspectable
    var lineWidth: CGFloat  {
        get{
            return self.layer.borderWidth
        }
        set{
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor {
        get{
            return UIColor(cgColor: self.layer.borderColor ?? UIColor.black.cgColor)
        }
        set{
            self.layer.borderColor = newValue.cgColor
        }
    }
}

@IBDesignable
class RoundImage: UIImageView, RoundImageProtocol {
    
    @IBInspectable
    var radius: CGFloat = 0.0 {
        didSet {
            setRadius(corner: Double(radius))
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        set {
            layer.borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.black.cgColor)
        }
    }
}

extension RoundViewProtocol where Self: UIView {
    
    func setRadius(corner: Double) {
        guard corner != 0.5 else {
            circle()
            return
        }
        rounded(corner: corner)
    }
    
    func rounded(corner: Double) {
        layer.cornerRadius = CGFloat(corner)
        layer.masksToBounds = true
    }
    
    func circle() {
        let size = Double(min(frame.width, frame.height))
        rounded(corner: size / 2)
    }
}

extension RoundImageProtocol where Self: UIImageView {
    
    func setRadius(corner: Double) {
        guard corner != 0.5 else {
            circle()
            return
        }
        rounded(corner: corner)
    }
    
    func rounded(corner: Double) {
        layer.cornerRadius = CGFloat(corner)
        layer.masksToBounds = true
    }
    
    func circle() {
        let size = Double(min(frame.width, frame.height))
        rounded(corner: size / 2)
        layer.masksToBounds = false
        clipsToBounds = true
    }
}

