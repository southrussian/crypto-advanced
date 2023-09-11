//
//  StaticticView.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 21.11.2022.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .multilineTextAlignment(.leading)
            Text(stat.value)
                .foregroundColor(Color.theme.accent)
                .font(.callout)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
//                    .foregroundColor(stat.percetangeChange! >= 0 ? Color.theme.green : Color.theme.red)
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percetangeChange ?? 0) >= 0 ? 0 : 180))
                
                Text(stat.percetangeChange?.stringAsPercent() ?? "")
//                    .foregroundColor(stat.percetangeChange! >= 0 ? Color.theme.green : Color.theme.red)
                    .font(.caption)
                    .bold()
            }
            .foregroundColor((stat.percetangeChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percetangeChange == nil ? 0.0 : 1.0)
            
        }
    }
}

struct StaticticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView(stat: dev.stat1)
    }
}
