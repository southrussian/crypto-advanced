//
//  Double.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 12.11.2022.
//

import Foundation

extension Double {
    
    /// Double to Currency (2-6 decimals)
    private var currentFormatted2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current
//        formatter.currencyCode = "usd"
//        formatter.currencySymbol = "$"
        
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func asCurrencyWithTwoDecimals() -> String {
        let number = NSNumber(value: self)
        return currentFormatted2.string(from: number) ?? "$0.00"
    }
    
    func stringAsNumber() -> String {
        return String(format: "%.2f", self)
    }
    
    func stringAsPercent() -> String {
        return stringAsNumber() + "%"
    }
    
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""
        
        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.stringAsNumber()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.stringAsNumber()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.stringAsNumber()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.stringAsNumber()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.stringAsNumber()
            
        default:
            return "\(sign)\(self)"
            
        }
    }
}
