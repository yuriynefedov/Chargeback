//
//  SensoryFeedbackManager.swift
//
//  Created by Yuriy Nefedov on 23.10.2025.
//

import SwiftUI
import Combine

class HapticsManager: ObservableObject {
    @Published var request = SensoryFeedbackRequest(.impact)
    
    func fire(_ feedback: SensoryFeedback = .impact) {
        self.request = .init(feedback)
    }
}

struct SensoryFeedbackRequest: Identifiable, Equatable {
    let id = UUID().uuidString
    var feedback: SensoryFeedback
    
    init(_ feedback: SensoryFeedback) {
        self.feedback = feedback
    }
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
