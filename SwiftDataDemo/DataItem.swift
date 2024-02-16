//
//  DataItem.swift
//  SwiftDataDemo
//
//  Created by Jonathan Budiman on 2024/02/15.
//

import Foundation
import SwiftData

@Model
class DataItem: Identifiable {
    var id: String
    var name: String
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
}

