//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by Jonathan Budiman on 2024/02/15.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var items: [DataItem]
    
    var body: some View {
        VStack {
            Text("Tap on this button to add data")
            HStack {
                Button("Add an item") {
                    addItem()
                }
                
                Button("Delete all") {
                    deleteAll()
                }
            }
            
            
            
            List {
                ForEach(items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Button {
                            updateItem(item)
                        } label: {
                            Image(systemName: "arrow.triangle.2.circlepath")
                        }
                    }
                }.onDelete { indexes in
                    for index in indexes {
                        deleteItem(items[index])
                    }
                }
            }
            
        }
        .padding()
    }
    
    func addItem() {
        let item = DataItem(name: "Test Item")
        context.insert(item)
    }
    
    func deleteItem(_ item: DataItem) {
        context.delete(item)
    }
    
    func updateItem(_ item: DataItem) {
        item.name = "Updated Test Item"
        try? context.save()
    }
    
    func deleteAll() {
        try? context.delete(model: DataItem.self)
    }
    
}

#Preview {
    ContentView()
}
