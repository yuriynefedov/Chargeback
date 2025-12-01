//
//  Frequency.swift
//  CreateSubscription
//
//  Created by Yuri Nefedov on 01.12.2025.
//

import Foundation

enum Frequency: String, Identifiable, CaseIterable {
    case weekly
    case monthly
    case annually
    
    var title: String {
        self.rawValue.camelToTitleCase
    }
    
    var id: String { self.rawValue }
}
