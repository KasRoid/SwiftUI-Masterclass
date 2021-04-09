//
//  ContentView.swift
//  Africa
//
//  Created by Kas Song on 2021/04/01.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    @State private var isGridViewActive = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn = 1
    @State private var toolbarIcon = "square.grid.2x2"
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal),
                                           label: { AnimalListItemView(animal: animal) })
                        }
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(
                                    destination: AnimalDetailView(animal: animal),
                                    label: {
                                        AnimalGridItemView(animal: animal)
                                    })
                            }
                        }
                        .padding(10)
                        .animation(.easeIn)
                    }
                }
            }
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            print("List view is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        Button(action: {
                            print("Grid view is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.grid.2x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        }
    }
}

// MARK: - PreviewProvider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
