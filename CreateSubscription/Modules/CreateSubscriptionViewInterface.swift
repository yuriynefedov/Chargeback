//
//  CreateSubscriptionViewInterface.swift
//  CreateSubscription
//
//  Created by Yuri Nefedov on 01.12.2025.
//

import Foundation

protocol CreateSubscriptionViewInterface: BaseViewModel {
    var searchQuery: String { get set }
    var amountText: String { get set }
    var nameText: String { get set }
    var selectedCategory: Category? { get set }
    var startDate: Date { get set }
    var isActive: Bool { get set }
    var serviceList: [ServiceModel] { get }
    var selectedService: ServiceModel? { get }
    var viewState: ViewState { get }
    var selectedFrequency: Frequency? { get set }
    func selectService(_ service: ServiceModel?)
    func onAppear()
}
