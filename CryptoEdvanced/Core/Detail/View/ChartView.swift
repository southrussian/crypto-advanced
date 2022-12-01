//
//  ChartView.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 29.11.2022.
//

import SwiftUI

struct ChartView: View {
    
    private let data: [Double]
    private let maxY: Double
    private let minY: Double
    private let lineColor: Color
    private let startingDate: Date
    private let endingDate: Date
    @State private var percentage: CGFloat = 0
    
    init(coin: CoinModel) {
        data = coin.sparklineIn7D?.price ?? []
        maxY = data.max() ?? 0
        minY = data.min() ?? 0
        
        let priceChange = (data.last ?? 0) - (data.first ?? 0)
        lineColor = priceChange > 0 ? Color.theme.green : Color.theme.red
        
        endingDate = Date(coinString: coin.lastUpdated ?? "")
        startingDate = endingDate.addingTimeInterval(-7*24*60*60)
        
    }
    
    var body: some View {
        VStack {
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
                .trim(from: 0, to: percentage)
                .stroke(lineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                .shadow(color: lineColor, radius: 10, x: 0.0, y: 10)
                .shadow(color: lineColor.opacity(0.5), radius: 10, x: 0.0, y: 20)
                .shadow(color: lineColor.opacity(0.3), radius: 10, x: 0.0, y: 30)


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
                }
                    .padding(.horizontal, 8)
//                    .font(.caption)
//                    .foregroundColor(Color.theme.secondaryText)
                , alignment: .leading
                
        )
            HStack {
                Text(startingDate.asShortDateString())
                Spacer()
                Text(endingDate.asShortDateString())
            }
            .padding(.horizontal, 8)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.linear(duration: 1.0)) {
                    percentage = 1.0
                }
            }
        }
        
        
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(coin: dev.coin)
//            .frame(width: 200)
    }
}
