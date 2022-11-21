//
//  StaticticView.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 21.11.2022.
//

import SwiftUI

struct StaticticView: View {
    
    let stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(stat.value)
                .foregroundColor(Color.theme.accent)
                .font(.headline)
            Text(stat.percetangeChange?.stringAsPercent() ?? "")
                .foregroundColor(stat.percetangeChange! >= 0 ? Color.theme.green : Color.theme.red)
                .font(.headline)
        }
    }
}

struct StaticticView_Previews: PreviewProvider {
    static var previews: some View {
        StaticticView(stat: dev.stat1)
    }
}
