//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Kas Song on 2021/04/13.
//

import SwiftUI

struct ProductDetailView: View {
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            NavagationBarDetailView()
                .padding(.horizontal)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            HeaderDetailView()
                .padding(.horizontal)
            TopPartDetailView()
                .padding(.horizontal)
            Spacer()
        }
        .ignoresSafeArea(.all, edges: .all)
        .background(Color(red: sampleProduct.red,
                          green: sampleProduct.green,
                          blue: sampleProduct.blue)
                        .ignoresSafeArea(.all, edges: .all)
        )
    }
}

// MARK: - PreviewProvider
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .previewLayout(.fixed(width: 375, height: 812))
    }
}
