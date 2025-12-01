//
//  Category.swift
//  CreateSubscription
//
//  Created by Yuri Nefedov on 01.12.2025.
//

import Foundation

enum Category: String, Identifiable, CaseIterable {
    case subscription
    case utility
    case cardPayment
    case loan
    case rent
    
    var icon: String {
        "ic_\(self.rawValue.snakeCased)"
    }
    
    var title: String {
        self.rawValue.camelToTitleCase
    }
    
    var id: String { self.rawValue }
}
