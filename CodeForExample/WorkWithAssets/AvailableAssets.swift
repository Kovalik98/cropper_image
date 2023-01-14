//
//  AvailableAssets.swift
//  example
//
//  Created by Nazar Kovalyk on 21.04.2021.
//

import Foundation

class AvailableAssets {

    func availableAssetsFunc() -> [String: URL] {
        let pathToDir1 = Bundle.main.resourcePath!;
        let documentDirectory = pathToDir1
//        let docDir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//        print("   docDir:", docDir)
        do {
            let contents = try FileManager.default.contentsOfDirectory(at: URL(fileURLWithPath: documentDirectory), includingPropertiesForKeys: [],
                                                                       options: .skipsHiddenFiles)
            var assets = [String: URL]()
            for file in contents {
                let assetID = file.deletingPathExtension().lastPathComponent
                assets[assetID] = file
            }
            
            return assets
        }
        catch
        {
            return [:]
        }
    }
    
    
}
