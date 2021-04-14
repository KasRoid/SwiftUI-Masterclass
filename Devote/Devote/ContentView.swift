//
//  ContentView.swift
//  Devote
//
//  Created by Kas Song on 2021/04/14.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - Properties
    @State var task: String = ""
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    VStack(spacing: 16) {
                        TextField("New Task", text: $task)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                        Button(
                            action: { addItem() },
                            label: {
                                Spacer()
                                Text("SAVE")
                                Spacer()
                            })
                            .padding()
                            .font(.headline)
                            .foregroundColor(.white)
                            .background(isButtonDisabled ? Color.gray : Color.pink)
                            .cornerRadius(10)
                            .disabled(isButtonDisabled)
                    }
                    .padding()
                    List {
                        ForEach(items) { item in
                            VStack(alignment: .leading) {
                                Text(item.task ?? "")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(InsetGroupedListStyle())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3),
                            radius: 12)
                    .padding(.vertical, 0)
                    .frame(maxWidth: 640)
                }
            }
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
            }
            .navigationBarTitle("Daily Tasks", displayMode: .large)
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                #endif
            }
            .background(BackgroundImageView())
            .background(backgroundGradient.ignoresSafeArea(.all))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Helpers
extension ContentView {
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            task = ""
            hideKeyboard()
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

// MARK: - PreviewProvider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
