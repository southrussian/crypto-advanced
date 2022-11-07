//
//  HomeView.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 07.11.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    CircleButton(iconName: "info.bubble")
                    Spacer()
                    Text("Live Prices")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.theme.accent)
                    Spacer()
                    CircleButton(iconName: "chevron.right")
                }
                .padding(.horizontal)
                
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        
    }
}
