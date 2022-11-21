//
//  HomeView.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 07.11.2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                HomeHeader
                    .padding(.horizontal)
                HomeStatsView(showPortfolio: $showPortfolio)
                SearchBarView(SearchedText: $vm.searchText)
                FollowingExplanations
                if !showPortfolio {
                    List {
            //            CoinRowView(coin: DevPreview.instance.coin, showHoldingColumn: false)
                        ForEach(vm.allCoins) { coin in
                            CoinRowView(coin: coin, showHoldingColumn: false)
                                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                        }
                    }
                    .listStyle(PlainListStyle())
                    .transition(.move(edge: .leading))
                } else {
                    List {
                        ForEach(vm.portfolioCoins) { coin in
                            CoinRowView(coin: coin, showHoldingColumn: true)
                                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                        }
                    }
                    .listStyle(PlainListStyle())
                    .transition(.move(edge: .trailing))
                }
                
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
        .environmentObject(dev.homeVM)
        
    }
}

extension HomeView {
    private var HomeHeader: some View {
        HStack {
            CircleButton(iconName: showPortfolio ? "plus" : "info")
//                        .animation(.none)
                .background(CircleButtonAnimationView(animate: $showPortfolio))
                
            Spacer()
            Text(showPortfolio ? "Портфолио" : "Цены Live")
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
    private var FollowingExplanations: some View {
        HStack {
            Text("Валюта")
            Spacer()
            Text(showPortfolio ? "Накопления" : "")
            Text("Цена")
                .frame(width: UIScreen.main.bounds.width / 3.6, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
