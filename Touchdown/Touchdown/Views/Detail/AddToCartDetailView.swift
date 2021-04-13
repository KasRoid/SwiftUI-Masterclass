//
//  AddToCartDetailView.swift
//  Touchdown
//
//  Created by Kas Song on 2021/04/13.
//

import SwiftUI

struct AddToCartDetailView: View {
    
    // MARK: - Body
    var body: some View {
        Button(action: {},
               label: {
                Spacer()
                Text("Add to cart".uppercased())
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
        })
            .padding(15)
            .background(Color(red: sampleProduct.red,
                              green: sampleProduct.green,
                              blue: sampleProduct.blue)
            )
            .clipShape(Capsule())
    }
}

// MARK: - PreviewProvider
struct AddToCartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
