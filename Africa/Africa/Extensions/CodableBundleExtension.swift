//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Kas Song on 2021/04/02.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [CoverImage] {
        // 1. Locate the json File
        guard let url = url(forResource: file, withExtension: nil) else { fatalError("Failed to locate \(file) in bundle") }
        // 2. Create a property for the dat
        guard let data = try? Data(contentsOf: url) else { fatalError("Failed to load \(file) from bundle") }
        // 3. Create a decoder
        let decoder = JSONDecoder()
        // 4. Crate a property for the decoded data
        guard let loaded = try? decoder.decode([CoverImage].self, from: data) else { fatalError("Failed to decode \(file) from bundle.") }
        // 5. Return the ready-to-use data
        return loaded
    }
}
