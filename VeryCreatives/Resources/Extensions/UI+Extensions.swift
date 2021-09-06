//
//  UI+Extensions.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//

import UIKit

extension UIView {
    
    func rounded(corner: Double) {
        layer.cornerRadius = CGFloat(corner)
        layer.masksToBounds = true
    }
    
    func circle() {
        let size = Double(min(frame.width, frame.height)) - 1
        rounded(corner: size/2)
    }
}
