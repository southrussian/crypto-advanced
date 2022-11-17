//
//  SearchBarView.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 17.11.2022.
//

import SwiftUI


struct SearchBarView: View {
    
    @Binding var SearchedText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    SearchedText.isEmpty ? Color.theme.secondaryText : Color.theme.accent)
            TextField("Поиск по имени", text: $SearchedText)
                .autocorrectionDisabled(true)
                .foregroundColor(Color.theme.accent)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color.theme.accent)
                        .opacity(SearchedText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            SearchedText = ""
                        }
                    , alignment: .trailing
                        
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 22)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.3), radius: 2, x: 0, y: 0)
                
        )
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(SearchedText: .constant(""))
    }
}
