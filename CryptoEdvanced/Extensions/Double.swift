//
//  Double.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 12.11.2022.
//

import Foundation

extension Double {
    private var currentFormatted: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        return formatter
    }
}
