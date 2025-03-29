//
//  CacheManager.swift
//  LydiaTest
//
//  Created by Bastien Nizard on 29/03/2025.
//

import Foundation

class CacheManager {
    static let shared = CacheManager()

    // Save contacts in UserDefaults
    func saveContacts(_ contacts: [Contact]) {
        if let data = try? JSONEncoder().encode(contacts) {
            UserDefaults.standard.set(data, forKey: "cachedContacts")
        }
    }

    // Try to load contacts from UserDefaults
    func loadContacts() -> [Contact]? {
        guard let data = UserDefaults.standard.data(forKey: "cachedContacts") else {
            print("No data found in UserDefaults for 'cachedContacts'")
            return nil
        }

        do {
            let contacts = try JSONDecoder().decode([Contact].self, from: data)
            print("Contacts loaded: \(contacts)")  // Log loaded contacts
            return contacts
        } catch {
            print("Failed to decode contacts: \(error)")  // Log decoding error
            return nil
        }
    }
}
