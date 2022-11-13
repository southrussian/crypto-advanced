//
//  LocalFileManager.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 13.11.2022.
//

import Foundation
import SwiftUI

class localFileManager {
    static let instance = localFileManager()
    private init() { }
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        guard
            let data = image.pngData(),
            let url = getURLForImage(imageName: imageName, folderName: folderName)
            else { return }
        
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image \(error)")
        }
    }
    
    private func getURLForFolder(name: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        return url.appendingPathComponent(name)
    }
    
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(name: folderName) else {
            return nil
        }
        return folderURL.appendingPathComponent(imageName + ".png")
    }
}
