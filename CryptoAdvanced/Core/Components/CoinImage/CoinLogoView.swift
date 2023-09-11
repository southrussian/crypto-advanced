//
//  CoinLogoView.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 26.11.2022.
//

import SwiftUI

struct CoinLogoView: View {
    
    let coin: CoinModel
    var body: some View {
        VStack {
            CoinImageView(coin: coin)
                .frame(width: 50, height: 50)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(Color.theme.accent)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text(coin.name)
                .font(.caption)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .foregroundColor(Color.theme.secondaryText)
                .multilineTextAlignment(.center)
        }
    }
}

struct CoinLogoView_Previews: PreviewProvider {
    static var previews: some View {
        CoinLogoView(coin: dev.coin)
            .previewLayout(.sizeThatFits)
    }
}
