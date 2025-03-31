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

        cacheManager.saveContacts(MockData.contacts)

        let loadedContacts = cacheManager.loadContacts()

        XCTAssertNotNil(loadedContacts, "Loaded contact should not be nil")
        XCTAssertEqual(loadedContacts?.count, 2, "Loaded contact count should be 2")
        XCTAssertEqual(loadedContacts?.first?.name.first, "John", "Loaded contact first name should be 'John'")
    }
}
