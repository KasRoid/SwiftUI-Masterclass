//
//  OnboardingView.swift
//  Fructus
//
//  Created by Kas Song on 2021/03/25.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - Properties
    var fruits: [Fruit] = fruitsData
    
    // MARK: - Body
    var body: some View {
        TabView {
            ForEach(fruits) { fruit in
                FruitCardView(fruit: fruit)
            } //: Loop
        } //: Tab
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: - Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(fruits: fruitsData)
    }
}
