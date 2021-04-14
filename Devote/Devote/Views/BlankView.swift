//
//  BlankView.swift
//  Devote
//
//  Created by Kas Song on 2021/04/14.
//

import SwiftUI

struct BlankView: View {
    
    // MARK: - Body
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color.black)
        .opacity(0.5)
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - PreviewProvider
struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView()
            .previewDevice("iPhone 12 Pro")
    }
}
