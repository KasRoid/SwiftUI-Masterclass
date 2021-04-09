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
    
    @State private var isGridViewActive = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn = 1
    @State private var toolbarIcon = "square.grid.2x2"
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    createListView()
                } else {
                    createScrollView()
                }
            }
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        createToolBarButton(isGridButton: false, imageName: "square.fill.text.grid.1x2")
                        createToolBarButton(isGridButton: true, imageName: toolbarIcon)
                    }
                }
            }
        }
    }
}

// MARK: - Helpers
extension ContentView {
    private func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number: \(gridColumn)")
        
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
}

// MARK: - UI
extension ContentView {
    private func createListView() -> some View {
        List {
            CoverImageView()
                .frame(height: 300)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            ForEach(animals) { animal in
                NavigationLink(destination: AnimalDetailView(animal: animal),
                               label: { AnimalListItemView(animal: animal) })
            }
                CreditsView()
                    .modifier(CenterModifier())
        }
    }
    private func createScrollView() -> some View {
        ScrollView {
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
    private func createToolBarButton(isGridButton: Bool, imageName: String) -> some View {
        Button(
            action: {
                isGridViewActive = isGridButton
                haptics.impactOccurred()
                if isGridButton {
                    gridSwitch()
                }
            },
            label: {
                let color: Color = isGridButton ? (isGridViewActive ? .accentColor : .primary) : (isGridViewActive ? .primary : .accentColor)
                Image(systemName: imageName)
                    .font(.title2)
                    .foregroundColor(color)
            }
        )
    }
}

// MARK: - PreviewProvider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro")
    }
}
