//
//  CreateSubscriptionViewModel.swift
//  CreateSubscription
//
//  Created by Yuri Nefedov on 01.12.2025.
//

import Foundation
import Combine

final class CreateSubscriptionViewModel {
    @Published var searchQuery: String = String()
    @Published var nameText: String = String()
    @Published var amountText: String = String()
    @Published var selectedFrequency: Frequency?
    @Published var selectedCategory: Category?
    @Published var startDate: Date = Date()
    @Published var isActive: Bool = true
    @Published private(set) var selectedService: ServiceModel?
    @Published private(set) var viewState: ViewState = .idle

    private(set) var serviceList: ServiceList = .init()
    private var dataService: any DataServiceInterface
    
    init(dataService: DataServiceInterface) {
        self.dataService = dataService
    }
    
    private func fetchServiceList() {
        Task {
            do {
                setViewState(.loading)
                self.serviceList = try await dataService.fetchServiceList()
                setViewState(.loaded)
            } catch let error {
                self.setViewState(.failure)
                debugPrint("[Fetch Service List Error]: \(error.localizedDescription)")
            }
        }
    }
    
    @MainActor
    private func setViewState(_ viewState: ViewState) {
        self.viewState = viewState
    }
}

extension CreateSubscriptionViewModel: CreateSubscriptionViewInterface {
    func onAppear() {
        fetchServiceList()
    }
    
    func selectService(_ service: ServiceModel?) {
        self.selectedService = service
    }
}
