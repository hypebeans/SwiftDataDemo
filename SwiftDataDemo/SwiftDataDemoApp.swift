//
//  SwiftDataDemoApp.swift
//  SwiftDataDemo
//
//  Created by Jonathan Budiman on 2024/02/15.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: DataItem.self)
    }
}
