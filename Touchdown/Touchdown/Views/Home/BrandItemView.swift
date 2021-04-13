//
//  BrandItemView.swift
//  Touchdown
//
//  Created by Kas Song on 2021/04/13.
//

import SwiftUI

struct BrandItemView: View {
    
    // MARK: - Properties
    let brand: Brand
    
    // MARK: - Body
    var body: some View {
        Image(brand.image)
            .resizable()
            .scaledToFit()
            .padding()
            .background(Color.white.cornerRadius(12))
            .background(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1))
    }
}

// MARK: - PreviewProvider
struct BrandItemView_Previews: PreviewProvider {
    static var previews: some View {
        BrandItemView(brand: brands.first!)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
