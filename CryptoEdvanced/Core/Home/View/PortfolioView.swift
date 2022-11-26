//
//  PortfolioView.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 26.11.2022.
//

import SwiftUI

struct PortfolioView: View {
        
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Hi")
                }
            }
            .navigationTitle("Изменить")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                    }

                }
            })
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
