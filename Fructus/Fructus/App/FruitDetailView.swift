//
//  FruitDetailView.swift
//  Fructus
//
//  Created by Kas Song on 2021/03/25.
//

import SwiftUI

struct FruitDetailView: View {
    
    // MARK: - Properties
    var fruit: Fruit
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false,
                       content: { setContentVStack() })
                .edgesIgnoringSafeArea(.top)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Helpers
extension FruitDetailView {
    func setContentVStack() -> some View {
        VStack(alignment: .center, spacing: 20, content: {
            FruitHeaderView(fruit: fruit)
            VStack(alignment: .leading, spacing: 20, content: {
                Text(fruit.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(fruit.gradientColors[0])
                Text(fruit.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                // Nutrients
                FruitNutrientsView(fruit: fruit)
                // Subheadline
                Text("Learn more about \(fruit.title)".uppercased())
                    .fontWeight(.bold)
                    .foregroundColor(fruit.gradientColors[0])
                Text(fruit.description)
                    .multilineTextAlignment(.leading)
                // Link
                SourceLinkView()
                    .padding(.top, 10)
                    .padding(.bottom, 40)
            })
            .padding(.horizontal, 20)
            .frame(maxWidth: 640, alignment: .center)
        })
        .navigationBarTitle(fruit.title, displayMode: .inline)
        .navigationBarHidden(true)
    }
}

// MARK: - Preview
struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData.first!)
    }
}
