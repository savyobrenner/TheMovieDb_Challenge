//
//  String+Extensions.swift
//  VeryCreatives
//
//  Created by Brenner on 07/09/21.
//

import Foundation

extension String {
    
    func getTheYear() -> String {
        let year = String(self.prefix(4))
        return year
    }
    
    func getTheDay() -> String {
        let day = String(self.suffix(2))
        return day
    }
    
    func getTheMonth() -> String {
        let arrayString = Array(self)
        let month = String(arrayString[5..<7])
        return month
    }
    
    func formatDate() -> String {
        let year = getTheYear()
        let day = getTheDay()
        let month = getTheMonth()
        return "\(day)/\(month)/\(year)"
    }
}

