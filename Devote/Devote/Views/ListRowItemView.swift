//
//  ListRowItemView.swift
//  Devote
//
//  Created by Kas Song on 2021/04/16.
//

import SwiftUI

struct ListRowItemView: View {
 
    // MARK: - Properties
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    
    // MARK: - Body
    var body: some View {
        Toggle(isOn: $item.completion,
               label: {
                Text(item.task ?? "")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(item.completion ? Color.pink : Color.primary)
                    .padding(.vertical, 12)
                    .animation(.default)
               })
            .toggleStyle(CheckboxStyle())
            .onReceive(item.objectWillChange, perform: { _ in
                if viewContext.hasChanges {
                    try? viewContext.save()
                }
            })
    }
}
