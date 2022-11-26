//
//  PortfolioView.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 26.11.2022.
//

import SwiftUI

struct PortfolioView: View {
        
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var vm: HomeViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(SearchedText: $vm.searchText)
                    ScrollView(.horizontal, showsIndicators: true) {
                        LazyHStack(spacing: 10) {
                            ForEach(vm.allCoins) { coin in
                                Text(coin.symbol.uppercased())
                            }
                        }
                    }
                }
            }
            .navigationTitle("Изменить")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                    }

                }
            })
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(dev.homeVM)
    }
}
