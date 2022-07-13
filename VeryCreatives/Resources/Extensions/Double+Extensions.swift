//
//  Double+Extensions.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//

import Foundation

extension Double {
    func formatRating() -> Int {
        let value = (self.rounded() / 2)
        let validator = Int(self.rounded()) % 2 > 0
        return validator ? Int(-1 * value.rounded()) : Int(value.rounded())
    }
}

