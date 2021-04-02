//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Kas Song on 2021/04/02.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: - Properties
    let animal: Animal
    
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .center, spacing: 20) {
                // Hero Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                // Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(Color.accentColor
                                    .frame(height: 6)
                                    .offset(y: 24))
                // Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                // Gallery
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                // Facts
                // Description
                // Map
                // Link
            }
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        })
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals.first!)
                .previewDevice("iPhone 12 PRo")
        }
    }
}