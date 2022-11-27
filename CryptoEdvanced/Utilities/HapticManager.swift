//
//  HapticManager.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 28.11.2022.
//

import Foundation
import SwiftUI

class HapticManager {
    static let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
