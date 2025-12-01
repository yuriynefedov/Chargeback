//
//  View+Ext.swift
//  CreateSubscription
//
//  Created by Yuri Nefedov on 01.12.2025.
//

import SwiftUI

struct CardBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 20.0)
            .background(
                RoundedRectangle(cornerRadius: Constants.Layout.cornerRadius)
                    .fill(Color(Constants.Colors.subsCardBackground.name))
            )
        
    }
}

extension View {
    func cardBackground() -> some View {
        modifier(CardBackground())
    }
}
