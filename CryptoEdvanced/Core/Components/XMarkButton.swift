//
//  XMarkButton.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 26.11.2022.
//

// код не нужен, presentationMode устарел

import SwiftUI

struct XMarkButton: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}
