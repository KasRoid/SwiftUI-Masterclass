//
//  BrandGridView.swift
//  Touchdown
//
//  Created by Kas Song on 2021/04/13.
//

import SwiftUI

struct BrandGridView: View {
    
    // MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHGrid(rows: gridLayout, spacing: columnSpacing, content: {
                ForEach(brands) { brand in
                    BrandItemView(brand: brand)
                }
            })
            .frame(height: 200)
            .padding(4)
        })
    }
}

// MARK: - PreviewProvider
struct BrandGridView_Previews: PreviewProvider {
    static var previews: some View {
        BrandGridView()
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}
