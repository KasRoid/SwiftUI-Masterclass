//
//  SettingsView.swift
//  Fructus
//
//  Created by Kas Song on 2021/03/29.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 20) {
                    // MARK: - Section 1
                    GroupBox(label: HStack { SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")},
                             content: {
                                Divider().padding(.vertical, 4)
                                HStack(alignment: .center) {
                                    Image("logo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(9)
                                    Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essentail nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                        .font(.footnote)
                                }
                             })
                    // MARK: - Section 2
                    // MARK: - Section 3
                } // VStack
                .navigationBarTitle(Text("Setting"), displayMode: .large)
                .navigationBarItems(trailing: Button(action: { presentationMode.wrappedValue.dismiss() },
                                                     label: { Image(systemName: "xmark") }))
                .padding()
            }) // ScrollView
        }
    }
}

// MARK: - PreviewProvider
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
