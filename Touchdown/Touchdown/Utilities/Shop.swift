//
//  Shop.swift
//  Touchdown
//
//  Created by Kas Song on 2021/04/13.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
