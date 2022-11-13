//
//  CoinImageViewModel.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 13.11.2022.
//

import Foundation
import SwiftUI

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coin: CoinModel
    private let dataService: CoinImageService
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(urlString: coin.image)
        getImage()
    }
    private func getImage() {
        
    }
}
