//
//  CoinRowView.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 12.11.2022.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            
            if showHoldingColumn {
                centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
        .padding(.vertical, 1)
        .background(
            Color.theme.background.opacity(0.01))
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: dev.coin, showHoldingColumn: true)
                .previewLayout(.sizeThatFits)
            
            CoinRowView(coin: dev.coin, showHoldingColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
        }
        
    }
}

extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(maxWidth: 30)
            
//            Circle()
                CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.callout)
                .fontWeight(.bold)
                .foregroundColor(Color.theme.accent)
                .padding(.leading, 7)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWithTwoDecimals())
                .font(.callout)
                .fontWeight(.bold)
            Text((coin.currentHoldings ?? 0).stringAsNumber())
                .bold()
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack {
            Text(coin.currentPrice.asCurrencyWithTwoDecimals())
                .font(.callout)
                .fontWeight(.bold)
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.stringAsPercent() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red
                    )
                .padding(.leading)
                .bold()
        }
        .frame(width: UIScreen.main.bounds.width / 3.5)
    }
}
