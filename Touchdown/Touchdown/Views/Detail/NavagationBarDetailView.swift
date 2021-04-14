//
//  NavagationBarDetailView.swift
//  Touchdown
//
//  Created by Kas Song on 2021/04/13.
//

import SwiftUI

struct NavagationBarDetailView: View {
    
    // MARK: - Properties
    @EnvironmentObject var shop: Shop
    
    // MARK: - Body
    var body: some View {
        HStack {
            Button(
                action: {
                    feedback.impactOccurred()
                    withAnimation(.easeIn) {
                        shop.selectedProduct = nil
                        shop.showingProduct = false
                    }
                },
                label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.white)
                }
            )
            Spacer()
            Button(
                action: {},
                label: {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.white)
                }
            )
        }
    }
}

// MARK: - PreviewProvider
struct NavagationBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavagationBarDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
