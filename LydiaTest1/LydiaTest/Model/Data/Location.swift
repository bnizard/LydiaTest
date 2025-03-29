//
//  Location.swift
//  LydiaTest
//
//  Created by Bastien Nizard on 29/03/2025.
//

struct Location: Codable {
    let street: Street
    let city: String
    let state: String
    let country: String
    let postcode: String
    let coordinates: Coordinates
    let timezone: Timezone

    // Custom decoding for postcode because it can be a String or Int value
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Try to decode postcode as String, if not we try as Int
        if let postcodeString = try? container.decode(String.self, forKey: .postcode) {
            postcode = postcodeString
        } else if let postcodeInt = try? container.decode(Int.self, forKey: .postcode) {
            postcode = String(postcodeInt)
        } else {
            throw DecodingError.dataCorruptedError(forKey: .postcode, in: container, debugDescription: "Postcode is not a valid String or Int.")
        }

        // Decode other properties
        street = try container.decode(Street.self, forKey: .street)
        city = try container.decode(String.self, forKey: .city)
        state = try container.decode(String.self, forKey: .state)
        country = try container.decode(String.self, forKey: .country)
        coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
        timezone = try container.decode(Timezone.self, forKey: .timezone)
    }
}
