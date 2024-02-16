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
            Button("Add an item") {
                addItem()
            }
            
                List {
                    ForEach(items) { item in
                        Text(item.name)
                    }.onDelete { indexes in
                        for index in indexes {
                            deleteItem(item[indexes])
                        }
                    })
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
    
}

#Preview {
    ContentView()
}
