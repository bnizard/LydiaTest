//
//  ContactViewModel.swift
//  LydiaTest
//
//  Created by Bastien Nizard on 29/03/2025.
//

import Foundation

class ContactsViewModel {
    var contacts : [Contact] = []
    var isLoading: ((Bool) -> Void)? // Closure to notify loading state changes
    var onUpdate: (() -> Void)?

    func fetchContacts() {
        isLoading?(true) // Notify UI that loading has started

        APIService.shared.fetchContact { [weak self] result in

            guard let self = self else { return }

            DispatchQueue.main.async {
                self.isLoading?(false) // Notify UI that loading has ended
                
                switch result {
                case .success(let contacts):
                    self.contacts = contacts
                    self.onUpdate?()
                    
                    CacheManager.shared.saveContacts(contacts)
                case .failure(let error):
                    print("Error: \(error)")

                    if let cachedContacts = CacheManager.shared.loadContacts(), !cachedContacts.isEmpty {
                        self.contacts = cachedContacts
                        self.onUpdate?()
                    }
                }
            }
        }
    }
}
