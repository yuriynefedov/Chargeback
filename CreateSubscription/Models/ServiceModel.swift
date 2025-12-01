//
//  ServiceModel.swift
//  CreateSubscription
//
//  Created by Yuri Nefedov on 01.12.2025.
//

import Foundation

typealias ServiceList = [ServiceModel]

struct ServiceModel: Identifiable, Codable {
    var id: UUID = UUID()
    var iconName: String
    var name: String
}

