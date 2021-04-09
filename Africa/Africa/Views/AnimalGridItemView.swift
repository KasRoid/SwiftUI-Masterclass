//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Kas Song on 2021/04/08.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    // MARK: - Properties
    let animal: Animal
    
    // MARK: - Body
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

// MARK: - PreviewProvider
struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridItemView(animal: animals.first!)
            .previewDevice("iPhone 12 Pro")
    }
}
