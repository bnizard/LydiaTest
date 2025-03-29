//
//  ContactViewModel.swift
//  LydiaTest
//
//  Created by Bastien Nizard on 29/03/2025.
//

import Foundation

class ContactsViewModel {
    var contacts : [Contact] = []
    var onUpdate: (() -> Void)?

    func fetchContacts() {
        APIService.shared.fetchContact { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let contacts):
                    self?.contacts.removeAll()
                    self?.contacts.append(contentsOf: contacts)
                    self?.onUpdate?()
                    
                    CacheManager.shared.saveContacts(contacts)
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }

    }
}
