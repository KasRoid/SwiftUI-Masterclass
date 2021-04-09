//
//  CenterModifier.swift
//  Africa
//
//  Created by Kas Song on 2021/04/09.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
