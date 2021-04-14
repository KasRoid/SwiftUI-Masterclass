//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Kas Song on 2021/04/14.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
