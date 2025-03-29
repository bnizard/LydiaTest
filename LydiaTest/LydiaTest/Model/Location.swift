//
//  Location.swift
//  LydiaTest
//
//  Created by Bastien Nizard on 29/03/2025.
//

struct Location: Codable {
    let street: String
    let city: String
    let state: String
    let country: String
    let postcode: String
    let coordinates: Coordinates
    let timezone: Timezone
}
