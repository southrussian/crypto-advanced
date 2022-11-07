//
//  CircleButton.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 07.11.2022.
//

import SwiftUI

struct CircleButton: View {
    let iconName: String
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50, alignment: .center)
            .background(
            Circle()
                .foregroundColor(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.7), radius: 1, x: 0, y: 0)
            )
            .padding()
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleButton(iconName: "externaldrive.fill.badge.person.crop")
                .previewLayout(.sizeThatFits)
            CircleButton(iconName: "lungs")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
        
    }
}
