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
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 20) {
                    setFructusGroupBox()
                    setCustomizationGroupBox()
                    setApplicationGroupBox()
                } // VStack
                .navigationBarTitle(Text("Setting"), displayMode: .large)
                .navigationBarItems(trailing: Button(action: { presentationMode.wrappedValue.dismiss() },
                                                     label: { Image(systemName: "xmark") }))
                .padding()
            }) // ScrollView
        }
    }
}

// MARK: - Helpers
extension SettingsView {
    func setFructusGroupBox() -> some View {
        return GroupBox(label: HStack { SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")},
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
    }
    func setCustomizationGroupBox() -> some View {
        return GroupBox(label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush"),
                        content: {
                            Divider().padding(.vertical, 4)
                            Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                                .padding(.vertical, 8)
                                .frame(minHeight: 60)
                                .layoutPriority(1)
                                .font(.footnote)
                                .multilineTextAlignment(.leading)
                            
                            Toggle(isOn: $isOnboarding, label: {
                                performToggleEffects()
                            })
                            .padding()
                            .background(Color(UIColor.tertiarySystemBackground)
                                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous)))
                        })
    }
    func setApplicationGroupBox() -> some View {
        return GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone"),
                        content: {
                            SettingsRowView(name: "Developer", content: "Kas")
                            SettingsRowView(name: "Designer", content: "Robert Petras")
                            SettingsRowView(name: "Compatibility", content: "iOS 14")
                            SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                            SettingsRowView(name: "Twitter", linkLabel: "@RobertPetras", linkDestination: "twitter.com/robertpetras")
                            SettingsRowView(name: "SwiftUI", content: "2.0")
                            SettingsRowView(name: "Version", content: "1.1.0")
                        }
        )
    }
    func performToggleEffects() -> some View {
        if isOnboarding {
            return Text("Restarted".uppercased())
                .fontWeight(.bold)
                .foregroundColor(Color.green)
        } else {
            return Text("Restart".uppercased())
                .fontWeight(.bold)
                .foregroundColor(Color.secondary)
        }
    }
}

// MARK: - PreviewProvider
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .previewDevice("iPhone 12 Pro")
            .preferredColorScheme(.dark)
    }
}
