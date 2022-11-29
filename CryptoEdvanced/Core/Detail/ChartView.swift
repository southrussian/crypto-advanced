//
//  ChartView.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 29.11.2022.
//

import SwiftUI

struct ChartView: View {
    
    let data: [Double]
    let maxY: Double
    let minY: Double
    let lineColor: Color
    
    init(coin: CoinModel) {
        data = coin.sparklineIn7D?.price ?? []
        maxY = data.max() ?? 0
        minY = data.min() ?? 0
        
        let priceChange = (data.last ?? 0) - (data.first ?? 0)
        lineColor = priceChange > 0 ? Color.theme.green : Color.theme.green
        
    }
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                for index in data.indices {
                    let xPos = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
                    let yAxis = maxY - minY
                    let yPos = (1 - CGFloat((data[index] - minY) / yAxis)) * geometry.size.height
                    
                    if index == 0 {
                        path.move(to: CGPoint(x: xPos, y: yPos))
                    }
                    path.addLine(to: CGPoint(x: xPos, y: yPos))
                    
                }
                
            }
            .stroke(lineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
        }
        .frame(height: 200)
        .background(
            VStack {
                Divider()
                Spacer()
                Divider()
                Spacer()
                Divider()
            }
        )
        .overlay(
            VStack {
                Text(maxY.formattedWithAbbreviations())
                Spacer()
                let price = (maxY + minY) / 2
                Text(price.formattedWithAbbreviations())
                Spacer()
                Text(minY.formattedWithAbbreviations())
            }.padding(.horizontal, 8)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText), alignment: .leading
            
        )
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(coin: dev.coin)
//            .frame(width: 200)
    }
}
