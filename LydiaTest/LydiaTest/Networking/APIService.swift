//
//  APIService.swift
//  LydiaTest
//
//  Created by Bastien Nizard on 29/03/2025.
//

import Foundation

class APIService {
    static let shared = APIService()
    private let url = "https://randomuser.me/api/?results=10"

    func fetchContact(completion: @escaping (Result<[Contact], Error>) -> Void) {
        guard let requestUrl = URL(string: url) else { return }

        URLSession.shared.dataTask(with: requestUrl) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let decodeResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(.success(decodeResponse.results))
            } catch {
                completion(.failure(error))
            }

        }.resume()

    }
}
