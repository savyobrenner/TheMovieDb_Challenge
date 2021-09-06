//
//  Double+Extensions.swift
//  VeryCreatives
//
//  Created by Brenner on 06/09/21.
//

import Foundation

extension Double {
    func formatRating() -> Int {
        switch self {
        case 0...1:
            return -1
        case 1...2:
            return 1
        case 2...3:
            return -2
        case 3...4:
            return 2
        case 4...5:
            return -3
        case 5...6:
            return 3
        case 6...7:
            return -4
        case 7...8:
            return 4
        case 8...9:
            return -5
        case 9...10:
            return 5
        default:
            return 0
        }
    }
    
}

