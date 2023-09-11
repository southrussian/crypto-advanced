//
//  StatisticModel.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 21.11.2022.
//

import Foundation

struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percetangeChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percetangeChange = percentageChange
    }
}

let newModel = StatisticModel(title: "", value: "", percentageChange: nil)
