//
//  FructusApp.swift
//  Fructus
//
//  Created by Kas Song on 2021/03/24.
//

import SwiftUI

@main
struct FructusApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView(fruits: fruitsData)
            } else {
                ContentView()
            }
        }
    }
}
