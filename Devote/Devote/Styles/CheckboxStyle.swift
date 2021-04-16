//
//  CheckboxStyle.swift
//  Devote
//
//  Created by Kas Song on 2021/04/16.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
    
    // MARK: - Body
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundColor(configuration.isOn ? .pink : .primary)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                    configuration.isOn
                        ? playSound(sound: "sound-rise", type: "mp3")
                        : playSound(sound: "sound-tap", type: "mp3")
                    feedback.notificationOccurred(.success)
                }
            configuration.label
        }
    }
}

// MARK: - PreviewProvider
struct CheckboxStyle_Previews: PreviewProvider {
    static var previews: some View {
        Toggle("Placeholder label", isOn: .constant(true))
            .toggleStyle(CheckboxStyle())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
