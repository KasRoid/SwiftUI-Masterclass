//
//  BlankView.swift
//  Devote
//
//  Created by Kas Song on 2021/04/14.
//

import SwiftUI

struct BlankView: View {
    // MARK: - PreviewProvider
    var backgroundColor: Color
    var backgroundOpacity: Double
    
    // MARK: - Body
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(backgroundColor)
        .opacity(backgroundOpacity)
        .blendMode(.overlay)
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - PreviewProvider
struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(backgroundColor: Color.black, backgroundOpacity: 0.3)
            .previewDevice("iPhone 12 Pro")
            .background(BackgroundImageView())
            .background(backgroundGradient.ignoresSafeArea(.all))
    }
}
