//
//  DetailView.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 29.11.2022.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var vm: DetailViewModel
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private let spacing: CGFloat = 30
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        print("Init \(coin.name)")
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("BTC")
                    .frame(height: 150)
                Text("Обзор")
                    .foregroundColor(Color.theme.accent)
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                
                LazyVGrid(columns: columns,
                          alignment: .leading,
                spacing: spacing,
                          pinnedViews: []) {
                    ForEach(vm.overviewStatistic) { stat in
                        StatisticView(stat: stat)
                    }
                }
                
                Text("Дополнительно")
                    .foregroundColor(Color.theme.accent)
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                
                LazyVGrid(columns: columns,
                          alignment: .leading,
                spacing: spacing,
                          pinnedViews: []) {
                    ForEach(vm.additionalStatistic) { stat in
                        StatisticView(stat: stat)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(vm.coin.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    Text(vm.coin.symbol.uppercased())
                        .font(.headline)
                    .foregroundColor(Color.theme.secondaryText)
                    CoinImageView(coin: vm.coin)
                        .frame(width: 25, height: 25)
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(coin: dev.coin)
        }
    }
}

struct DetailLoadingView: View {
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}
