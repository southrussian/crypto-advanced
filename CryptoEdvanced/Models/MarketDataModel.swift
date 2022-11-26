//
//  MarketDataModel.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 21.11.2022.
//

import Foundation

// https://api.coingecko.com/api/v3/global

struct MarketDataModel: Codable {
//    let activeCryptocurrencies, upcomingIcos, ongoingIcos, endedIcos: Int?
//    let markets: Int?
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
//    let updatedAt: Int?
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "\(item.value)"
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "\(item.value)"
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.stringAsPercent()
        }
        return ""
    }
}

struct GlobalData: Codable {
    let data: MarketDataModel?
}
