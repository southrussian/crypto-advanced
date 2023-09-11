//
//  UIApplication.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 17.11.2022.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
