//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Kas Song on 2021/04/14.
//

import SwiftUI

struct BackgroundImageView: View {
    
    // MARK: - Body
    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

// MARK: - PreviewProvider
struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
            .previewDevice("iPhone 12 Pro")
    }
}
