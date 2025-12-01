//
//  BaseView.swift
//  CreateSubscription
//
//  Created by Yuri Nefedov on 01.12.2025.
//

import SwiftUI

protocol BaseView: View {
    associatedtype ViewModel: BaseViewModel
    associatedtype Content: View
    var viewModel: ViewModel { get }
    var content: Content { get }
}

extension BaseView {
    var body: some View {
        content
    }
}

protocol RootView: BaseView {
    associatedtype NavBar: View
    var navigationBar: NavBar { get }
}

extension RootView {
    var body: some View {
        VStack(spacing: .zero) {
            navigationBar
            self.content
        }
        .background(Color(Constants.Colors.mainBackground.name))
        .preferredColorScheme(.light)
    }
}
