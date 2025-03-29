//
//  DateDecodingHelper.swift
//  LydiaTest
//
//  Created by Bastien Nizard on 29/03/2025.
//

import Foundation

// Custom DateFormatter that includes milliseconds
let customDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" // Format to include milliseconds
    formatter.timeZone = TimeZone(abbreviation: "UTC") // Timezone as UTC (Z)
    return formatter
}()

// Reusable helper function for decoding Date properties
extension KeyedDecodingContainer {
    func decodeDate(forKey key: Key) throws -> Date {
        let dateString = try self.decode(String.self, forKey: key)
        if let decodedDate = customDateFormatter.date(from: dateString) {
            return decodedDate
        } else {
            throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "Date string is not in the correct format.")
        }
    }
}

// Reusable helper function for encode Date properties
extension KeyedEncodingContainer {
    mutating func encodeDate(_ value: Date, forKey key: Key) throws {
        let dateString = customDateFormatter.string(from: value)
        try self.encode(dateString, forKey: key)
    }
}
