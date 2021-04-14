//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by Kas Song on 2021/04/12.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
