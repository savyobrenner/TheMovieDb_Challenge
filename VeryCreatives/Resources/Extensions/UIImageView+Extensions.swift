//
//  UIImageView+Extensions.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(path: String, isAPIImage: Bool = false) {
        
        var fullPath = path
        
        if isAPIImage {
            fullPath = BasePath.getImagesTheMovieDBAPI + path
        }
        
        let url = URL(string: fullPath)
        self.kf.indicatorType = .activity
        DispatchQueue.main.async {
            self.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        }
    }
    
    func applyGradient() {
        
        UIGraphicsBeginImageContext(self.frame.size)
        let context = UIGraphicsGetCurrentContext()

        self.draw(self.frame)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let locations:[CGFloat] = [0.0, 1.0]

        let bottom = UIColor.black.cgColor
        let top = UIColor.clear.cgColor

        let colors = [top, bottom] as CFArray

        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: locations)

        let startPoint = CGPoint(x: self.frame.size.width/2, y: 0)
        let endPoint = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height)

        context!.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))

        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        self.image = image
    }
}

extension Array where Element == UIImageView {
    func updateStars(_ index: Int) {
        let starFilled = UIImage(systemName: "star.fill")
        let starEmpty = UIImage(systemName: "star")
        let starHalfFilled = UIImage(systemName: "star.leadinghalf.fill")
        
        for star in self {
            if star.tag <= abs(index) {
                if star.tag == abs(index) && index < 0 {
                    star.image = starHalfFilled
                    continue
                }
                
                star.image = starFilled
            } else {
                star.image = starEmpty
            }
        }
    }
}

