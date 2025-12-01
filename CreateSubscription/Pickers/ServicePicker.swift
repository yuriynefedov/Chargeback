//
//  ServicePicker.swift
//  CreateSubscription
//
//  Created by Yuriy Nefedov on 01.12.2025.
//

import SwiftUI

struct ServicePicker<VM: CreateSubscriptionViewInterface>: View {
    @Binding var servicePickerVisible: Bool
    @ObservedObject var viewModel: VM
    @FocusState private var searchFocused: Bool
    
    var body: some View {
        VStack(spacing: 20.0) {
            VStack(spacing: 12.0) {
                RoundedRectangle(cornerRadius: Constants.Layout.thumbCornerRadius)
                    .fill(Color(Constants.Colors.thumbFill.name))
                    .frame(width: 38.0, height: 6.0)
                ZStack {
                    Text("Service")
                        .font(.graphik(size: 18, weight: .medium))
                        .foregroundStyle(Color(Constants.Colors.textBlack.name))
                    Button {
                        self.servicePickerVisible = false
                    } label: {
                        Text("Done")
                            .font(.graphik(size: 18, weight: .medium))
                            .foregroundStyle(Color(Constants.Colors.toggleTint.name))
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            .padding(.horizontal, 16.0)
            .padding(.top, 6.0)
            HStack(spacing: .zero) {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $viewModel.searchQuery)
                    .focused($searchFocused)
                    .padding(.leading, 12.0)
            }
            .frame(height: 44.0)
            .padding(.horizontal, 12.0)
            .background(
                ZStack {
                    if searchFocused {
                        RoundedRectangle(cornerRadius: 14.0)
                            .stroke(Color(Constants.Colors.focusStroke.name), lineWidth: 4.0)
                    }
                    RoundedRectangle(cornerRadius: 12.0)
                        .fill(.white)
                        .padding(2)
                    RoundedRectangle(cornerRadius: 12.0)
                        .stroke(Color(Constants.Colors.toggleTint.name), lineWidth: 1.0)
                        .padding(2)
                }
                    .animation(.easeIn, value: searchFocused)
            )
            .padding(.vertical, 20.0)
            .padding(.horizontal, 16.0)
            ScrollView {
                VStack(spacing: .zero) {
                    ForEach(viewModel.serviceList) { service in
                        Button {
                            viewModel.selectService(service)
                            self.servicePickerVisible = false
                        } label: {
                            VStack(spacing: .zero) {
                                HStack(spacing: .zero) {
                                    Image(service.iconName)
                                    Text(service.name)
                                        .font(.graphik(size: 16, weight: .regular))
                                        .foregroundStyle(Color(Constants.Colors.textBlack.name))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 14.0)
                                }
                                .frame(height: 60.0)
                                Divider()
                            }
                        }
                    }
                }
                .padding(.horizontal, 16.0)
            }
        }
    }
}
