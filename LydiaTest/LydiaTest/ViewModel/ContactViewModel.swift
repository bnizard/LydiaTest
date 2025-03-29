//
//  ContactViewModel.swift
//  LydiaTest
//
//  Created by Bastien Nizard on 29/03/2025.
//

import Foundation

class ContactViewModel {
    var contacts : [Contact] = []

    func fetchContacts() {
        APIService.shared.fetchUsers { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let contacts):
                    self?.contacts.append(contentsOf: contacts)
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }

    }
}
