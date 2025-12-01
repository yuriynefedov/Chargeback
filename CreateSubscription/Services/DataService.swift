//
//  DataService.swift
//  CreateSubscription
//
//  Created by Yuri Nefedov on 01.12.2025.
//

import Foundation

protocol DataServiceInterface {
    func fetchServiceList() async throws -> ServiceList
}

final class ServiceRepository {
    
}

extension ServiceRepository: DataServiceInterface {
    func fetchServiceList() async -> ServiceList {
        .init()
    }
}

final class MockServiceRepository {
    
}

extension MockServiceRepository: DataServiceInterface {
    func fetchServiceList() async throws -> ServiceList {
        [
            .init(iconName: "netflix", name: "Netflix"),
            .init(iconName: "hulu", name: "Hulu"),
            .init(iconName: "spotify", name: "Spotify"),
            .init(iconName: "ps", name: "PlayStation+"),
            .init(iconName: "paramount", name: "Paramount+"),
            .init(iconName: "yt", name: "YouTube Music"),
        ]
    }
}
