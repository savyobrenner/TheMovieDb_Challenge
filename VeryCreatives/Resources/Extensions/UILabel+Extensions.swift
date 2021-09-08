//
//  UILabel+Extensions.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//

import UIKit

extension UILabel {
    
    var numberOfVisibleLines: Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
        let textHeight = sizeThatFits(maxSize).height
        let lineHeight = font.lineHeight
        return Int(ceil(textHeight / lineHeight))
    }
    
    func setRegularFontRange(fullTextInput : String? = nil , changeText : String, size: CGFloat) {
        var fullText = self.text ?? ""
        
        if let validator = fullTextInput {
            fullText = validator
        }
        
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        let font = UIFont.systemFont(ofSize: size)
        attribute.addAttribute(.font, value: font, range: range)
        self.attributedText = attribute
    }
    
    func setBoldFontRange(fullTextInput : String? = nil , changeText : String, size: CGFloat) {
        var fullText = self.text ?? ""
        
        if let validator = fullTextInput {
            fullText = validator
        }
        
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        let font = UIFont.systemFont(ofSize: size, weight: .bold)
        attribute.addAttribute(.font, value: font, range: range)
        self.attributedText = attribute
    }
}

extension Array where Element == UILabel {
    func updateGenres(_ genres: [String]) {
        let numberOfGenres = genres.count
        var i = 0
        for genre in genres {
            if i >= 3 { break }
            let currentLabel = self[i]
            if currentLabel.tag <= numberOfGenres {
                currentLabel.isHidden = false
                currentLabel.text = genre
            }
            
            i += 1
        }
        if genres.count < 3 {
            self[genres.count].isHidden = true
        }
    }
}

