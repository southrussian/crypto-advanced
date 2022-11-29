//
//  DetailViewModel.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 29.11.2022.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink { returnedCoinDetails in
                print("Recieved coin detail data")
                print(returnedCoinDetails)
            }
            .store(in: &cancellables)
    }
}
