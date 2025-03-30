//
//  MockAPIService.swift
//  LydiaTest
//
//  Created by Bastien Nizard on 30/03/2025.
//

import Foundation

// Mock APIService
class MockAPIService: APIServiceProtocol {
    func fetchContact(completion: @escaping (Result<[Contact], any Error>) -> Void) {
        completion(.success(MockData.contacts))
    }
}
