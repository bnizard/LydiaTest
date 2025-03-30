//
//  CacheManagerTests.swift
//  LydiaTestTests
//
//  Created by Bastien Nizard on 30/03/2025.
//

import XCTest
@testable import LydiaTest

class CacheManagerTests: XCTestCase {
    var cacheManager: CacheManager!

    override func setUp() {
        super.setUp()

        cacheManager = CacheManager()
    }

    func testSaveAndLoadContacts() {
        let contact = Contact(
            gender: "Male",
            name: Name(title: "Mr.", first: "John", last: "Doe"),
            location: Location(street: Street(number: 123, name: "Main St"), city: "New York", state: "NY", country: "USA", postcode: "10001", coordinates: Coordinates(latitude: "40.7128", longitude: "-74.0060"), timezone: Timezone(offset: "-5", description: "EST")),
            email: "john.doe@example.com",
            login: Login(uuid: UUID(), username: "john_doe", password: "password123"),
            dob: DOB(date: Date(), age: 30),
            registered: Registered(date: Date(), age: 5),
            phone: "123-456-7890",
            cell: "987-654-3210",
            id: ID(name: "ID123", value: "ABC123"),
            picture: Picture(large: "http://example.com/large.jpg", medium: "http://example.com/medium.jpg", thumbnail: "http://example.com/thumbnail.jpg"),
            nat: "US"
        )

        cacheManager.saveContacts([contact])

        let loadedContacts = cacheManager.loadContacts()

        XCTAssertNotNil(loadedContacts, "Loaded contact should not be nil")
        XCTAssertEqual(loadedContacts?.count, 1, "Loaded contact count should be 1")
        XCTAssertEqual(loadedContacts?.first?.name.first, "John", "Loaded contact first name should be 'John'")
    }
}
