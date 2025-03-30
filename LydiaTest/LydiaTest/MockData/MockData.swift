//
//  MockData.swift
//  LydiaTestTests
//
//  Created by Bastien Nizard on 30/03/2025.
//

import Foundation

struct MockData {
    static let contacts: [Contact] = [
        Contact(
            gender: "Male",
            name: Name(title: "Mr.", first: "John", last: "Doe"),
            location: Location(
                street: Street(number: 123, name: "Main St"),
                city: "New York",
                state: "NY",
                country: "USA",
                postcode: "10001",
                coordinates: Coordinates(latitude: "40.7128", longitude: "-74.0060"),
                timezone: Timezone(offset: "-5", description: "EST")
            ),
            email: "john.doe@example.com",
            login: Login(uuid: UUID(), username: "john_doe", password: "password123"),
            dob: DOB(date: Date(), age: 30),
            registered: Registered(date: Date(), age: 5),
            phone: "123-456-7890",
            cell: "987-654-3210",
            id: ID(name: "ID123", value: "ABC123"),
            picture: Picture(large: "http://example.com/large.jpg", medium: "http://example.com/medium.jpg", thumbnail: "http://example.com/thumbnail.jpg"),
            nat: "US"
        ),
        Contact(
            gender: "Female",
            name: Name(title: "Ms.", first: "Jane", last: "Doe"),
            location: Location(
                street: Street(number: 456, name: "Broadway Ave"),
                city: "Los Angeles",
                state: "CA",
                country: "USA",
                postcode: "90001",
                coordinates: Coordinates(latitude: "34.0522", longitude: "-118.2437"),
                timezone: Timezone(offset: "-8", description: "PST")
            ),
            email: "jane.doe@example.com",
            login: Login(uuid: UUID(), username: "jane_doe", password: "password456"),
            dob: DOB(date: Date(), age: 28),
            registered: Registered(date: Date(), age: 3),
            phone: "987-654-3210",
            cell: "123-456-7890",
            id: ID(name: "ID456", value: "DEF456"),
            picture: Picture(large: "http://example.com/large2.jpg", medium: "http://example.com/medium2.jpg", thumbnail: "http://example.com/thumbnail2.jpg"),
            nat: "US"
        )
    ]
}
