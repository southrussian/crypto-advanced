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
    
    func asCurrencyWithSixDecimals() -> String {
        let number = NSNumber(value: self)
        return currentFormatted6.string(from: number) ?? "$0.00"
    }
    
    func stringAsNumber() -> String {
        return String(format: "%.2f", self)
    }
    
    func stringAsPercent() -> String {
        return stringAsNumber() + "%"
    }
}
