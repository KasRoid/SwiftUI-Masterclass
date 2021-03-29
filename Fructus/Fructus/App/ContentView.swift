//
//  ContentView.swift
//  Fructus
//
//  Created by Kas Song on 2021/03/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var isShowingSettings: Bool = false
    var fruits: [Fruit] = fruitsData
    
    // MARK: - Body
    var body: some View {
        NavigationView(content: {
            List(content: {
                ForEach(fruits.shuffled()) { fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    }
                }
            })
            .navigationTitle("Fruits")
            .navigationBarItems(trailing: Button(action: { isShowingSettings = true },
                                                 label: { Image(systemName: "slider.horizontal.3") }))
            .sheet(isPresented: $isShowingSettings, content: {
                SettingsView()
            })
        }) // NavigationView
    }
}

// MARK: - PreviewProvider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
