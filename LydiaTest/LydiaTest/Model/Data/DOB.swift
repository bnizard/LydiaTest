//
//  DOB.swift
//  LydiaTest
//
//  Created by Bastien Nizard on 29/03/2025.
//

import Foundation

struct DOB: Codable {
    let date: Date
    let age: Int

    // Custom init to handle date decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Use the reusable decodeDate helper to decode the date
        self.date = try container.decodeDate(forKey: .date)

        // Decode the age as usual
        self.age = try container.decode(Int.self, forKey: .age)
    }

    // Custom encode to handle date encoding
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        // Use the reusable encodeDate helper to encode the date
        try container.encodeDate(date, forKey: .date)

        // Encode the age as usual
        try container.encode(age, forKey: .age)
    }

    // CodingKeys enum
    enum CodingKeys: String, CodingKey {
        case date
        case age
    }
}
