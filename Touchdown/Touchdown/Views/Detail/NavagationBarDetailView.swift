//
//  NavagationBarDetailView.swift
//  Touchdown
//
//  Created by Kas Song on 2021/04/13.
//

import SwiftUI

struct NavagationBarDetailView: View {
    
    // MARK: - Body
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
            })
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundColor(.white)
            })
        }
    }
}

// MARK: - PreviewProvider
struct NavagationBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavagationBarDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
