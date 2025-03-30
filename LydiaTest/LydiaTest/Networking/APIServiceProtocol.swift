//
//  APIServiceProtocol.swift
//  LydiaTest
//
//  Created by Bastien Nizard on 30/03/2025.
//

protocol APIServiceProtocol {
    func fetchContact(completion: @escaping (Result<[Contact], Error>) -> Void)
}
