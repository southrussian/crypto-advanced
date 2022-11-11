//
//  HomeView.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 07.11.2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                HomeHeader
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

extension HomeView {
    private var HomeHeader: some View {
        HStack {
            CircleButton(iconName: showPortfolio ? "plus" : "info")
//                        .animation(.none)
                .background(CircleButtonAnimationView(animate: $showPortfolio))
                
            Spacer()
            Text(showPortfolio ? "Potfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButton(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()

                    }
                }
        }
    }
}
