//
//  CreateSubscriptionApp.swift
//  CreateSubscription
//
//  Created by Yuri Nefedov on 01.12.2025.
//

import SwiftUI

@main
struct CreateSubscriptionApp: App {
    var body: some Scene {
        WindowGroup {
            CreateSubscriptionView(
                viewModel: CreateSubscriptionViewModel(
                    dataService: MockServiceRepository()
                )
            )
        }
    }
}
