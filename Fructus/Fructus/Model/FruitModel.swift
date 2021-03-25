//
//  FruitModel.swift
//  Fructus
//
//  Created by Kas Song on 2021/03/25.
//

import SwiftUI

struct Fruit: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
