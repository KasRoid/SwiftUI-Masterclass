//
//  HeaderDetailView.swift
//  Touchdown
//
//  Created by Kas Song on 2021/04/13.
//

import SwiftUI

struct HeaderDetailView: View {
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Protective Gear")
            Text(sampleProduct.name)
                .font(.largeTitle)
                .fontWeight(.black)
        }
        .foregroundColor(.white)
    }
}

// MARK: - PreviewProvider
struct HeaderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
