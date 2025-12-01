//
//  CreateSubscriptionView.swift
//  CreateSubscription
//
//  Created by Yuri Nefedov on 01.12.2025.
//

import SwiftUI

struct CreateSubscriptionView<VM: CreateSubscriptionViewInterface>: RootView {
    
    @StateObject var viewModel: VM
    @State private var servicePickerVisible: Bool = false
    @State private var categoryPickerVisible: Bool = false
    @State private var frequencyPickerVisible: Bool = false
    
    @StateObject private var haptics = HapticsManager()
    
    var content: some View {
        mainContent
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear(perform: viewModel.onAppear)
            .sheet(isPresented: $servicePickerVisible) {
                servicePicker
            }
            .sheet(isPresented: $categoryPickerVisible) {
                CategoryPicker(pickerVisible: $categoryPickerVisible, category: $viewModel.selectedCategory)
                    .presentationDetents([.height(386)])
            }
            .sheet(isPresented: $frequencyPickerVisible) {
                FrequencyPicker(pickerVisible: $frequencyPickerVisible, frequency: $viewModel.selectedFrequency)
                    .presentationDetents([.height(266)])
            }
    }
    
    var navigationBar: some View {
        HStack(spacing: 14.0) {
            Button {
                haptics.fire()
                withAnimation {
                    self.viewModel.selectService(nil)
                }
            } label: {
                Image(viewModel.selectedService == nil ? Constants.IconName.icXmarkCircle.name : Constants.IconName.icArrowBackCircle.name)
            }
            Text("Create Subscription")
                .font(.graphik(size: 18, weight: .medium))
                .foregroundStyle(Color(Constants.Colors.textBlack.name))
                .frame(maxWidth: .infinity, alignment: .center)
            Button {
                haptics.fire()
            } label: {
                Text("Save")
                    .font(.graphik(size: 18, weight: .medium))
                    .foregroundStyle( viewModel.selectedService == nil ? .gray : Color(Constants.Colors.toggleTint.name))
            }
            .disabled(viewModel.selectedService == nil)
        }
        .padding(.top, 14.0)
        .padding(.horizontal, 16.0)
    }
    
    var mainContent: some View {
        ScrollView {
            VStack(spacing: .zero) {
                serviceSection
                infoSection
                periodSection
            }
        }
        .padding(.top, 20.0)
    }
    
    var serviceSection: some View {
        Button {
            haptics.fire()
            servicePickerVisible = true
        } label: {
            HStack(spacing: 14.0) {
                if let service = viewModel.selectedService {
                    Image(service.iconName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50.0, height: 50.0)
                    VStack(spacing: 2.0) {
                        Text(service.name)
                            .font(.graphik(size: 18, weight: .medium))
                            .foregroundStyle(Color(Constants.Colors.textBlack.name))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        if viewModel.amountText.isEmpty == false {
                            Text(viewModel.amountText)
                                .font(.graphik(size: 16, weight: .regular))
                                .foregroundStyle(Color(Constants.Colors.textDarkGray.name))
                                .lineLimit(1)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                } else {
                    Image(Constants.IconName.icPlusCircle.name)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50.0, height: 50.0)
                    Text("Choose a service")
                        .font(.graphik(size: 18, weight: .regular))
                        .foregroundStyle(Color(Constants.Colors.textLightGray.name))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Image(Constants.IconName.icChevronUpDown.name)
            }
            .frame(height: 90.0)
            .cardBackground()
        }
        .padding(.horizontal, 16.0)
        .padding(.top, 20.0)
    }
    
    var infoSection: some View {
        VStack(spacing: .zero) {
            Group {
                HStack(spacing: .zero) {
                    Text("Name")
                        .foregroundStyle(Color(Constants.Colors.textDarkGray.name))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    if let service = viewModel.selectedService {
                        Text(service.name)
                            .foregroundStyle(Color(Constants.Colors.textBlack.name))
                    } else {
                        TextField("Enter name", text: $viewModel.nameText)
                            .multilineTextAlignment(.trailing)
                            .foregroundStyle(Color(Constants.Colors.textLightGray.name))
                    }
                }
                
                HStack(spacing: .zero) {
                    Text("Amount")
                        .foregroundStyle(Color(Constants.Colors.textDarkGray.name))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Enter amount", text: $viewModel.amountText)
                        .multilineTextAlignment(.trailing)
                        .underline(!viewModel.amountText.isEmpty)
                }
                HStack(spacing: .zero) {
                    Text("Category")
                        .foregroundStyle(Color(Constants.Colors.textDarkGray.name))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Button {
                        haptics.fire()
                        categoryPickerVisible = true
                    } label: {
                        HStack(spacing: 4) {
                            if let category = viewModel.selectedCategory {
                                Image(category.icon)
                                Text(category.title)
                                    .foregroundStyle(Color(Constants.Colors.textBlack.name))
                            } else {
                                Text("Select category")
                                    .foregroundStyle(Color(Constants.Colors.textLightGray.name))
                            }
                            Image(Constants.IconName.icChevronUpDown.name)
                        }
                    }
                }
            }
            .font(.graphik(size: 16, weight: .regular))
            .frame(height: 60.0)
        }
        .frame(maxWidth: .infinity)
        .cardBackground()
        .padding(.horizontal, 16.0)
        .padding(.top, 20.0)
    }
    
    var periodSection: some View {
        VStack(spacing: .zero) {
            Group {
                HStack(spacing: .zero) {
                    Text("Start Date")
                        .foregroundStyle(Color(Constants.Colors.textDarkGray.name))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    DatePicker("", selection: $viewModel.startDate, displayedComponents: .date)
                        .labelsHidden()
                }
                HStack(spacing: .zero) {
                    Text("Frequency")
                        .foregroundStyle(Color(Constants.Colors.textDarkGray.name))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Button {
                        haptics.fire()
                        frequencyPickerVisible = true
                    } label: {
                        HStack(spacing: .zero) {
                            if let frequency = viewModel.selectedFrequency {
                                Text(frequency.title)
                                    .foregroundStyle(Color(Constants.Colors.textBlack.name))
                            } else {
                                Text("Select frequency")
                                    .foregroundStyle(Color(Constants.Colors.textLightGray.name))
                            }
                            Image(Constants.IconName.icChevronUpDown.name)
                        }
                    }
                }
                
                HStack(spacing: .zero) {
                    Text("Active")
                        .foregroundStyle(Color(Constants.Colors.textDarkGray.name))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Toggle("", isOn: $viewModel.isActive)
                        .labelsHidden()
                        .tint(Color(Constants.Colors.toggleTint.name))
                }
            }
            .font(.graphik(size: 16, weight: .regular))
            .frame(height: 60.0)
        }
        .frame(maxWidth: .infinity)
        .cardBackground()
        .padding(.horizontal, 16.0)
        .padding(.top, 20.0)
    }
    
    var servicePicker: some View {
        ServicePicker(
            servicePickerVisible: $servicePickerVisible,
            viewModel: viewModel
        )
    }
}

#Preview {
    CreateSubscriptionView(viewModel: CreateSubscriptionViewModel(dataService: MockServiceRepository()))
}
