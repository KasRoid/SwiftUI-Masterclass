//
//  CreditsView.swift
//  Africa
//
//  Created by Kas Song on 2021/04/09.
//

import SwiftUI

struct CreditsView: View {
    
    // MARK: - Body
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
                Copyright © Kas Song
                All right reserved
                Better Apps Less Code
                """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

// MARK: - PreviewProvider
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
