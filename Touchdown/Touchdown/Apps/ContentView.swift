//
//  ContentView.swift
//  Touchdown
//
//  Created by Kas Song on 2021/04/12.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                NavigationBarView()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 10) {
                        FeaturedTabView()
                            .padding(.vertical, 20)
                        CategoryGridView()
                        TitleView(title: "Helmets")
                        LazyVGrid(columns: gridLayout, spacing: 15, content: {
                            ForEach(products) { product in
                                ProductItemView(product: product)
                            }
                        })
                        .padding(15)
                        TitleView(title: "Brands")
                        BrandGridView()
                        FooterView()
                            .padding(.horizontal)
                    }
                })
            }
            .background(colorBackground.ignoresSafeArea(.all, edges: .all))
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

// MARK: - PreviewProvider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
