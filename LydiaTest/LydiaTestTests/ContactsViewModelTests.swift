//
//  ContactsViewModelTests.swift
//  LydiaTestTests
//
//  Created by Bastien Nizard on 30/03/2025.
//

import XCTest

@testable import LydiaTest

final class ContactsViewModelTests: XCTestCase {
    var viewModel: ContactsViewModel!
    var mockService: MockAPIService!

    override func setUp() {
        super.setUp()
        mockService = MockAPIService()
        viewModel = ContactsViewModel(contactAPIService: mockService)
    }
    
    func testFetchContactsUpdatesViewModel() {
        let expectation = XCTestExpectation(description: "ViewModel should update contacts")

        viewModel.onUpdate = {
            XCTAssertEqual(self.viewModel.contacts.count, 2, "ViewModel should contain two contacts")
            expectation.fulfill()
        }

        viewModel.fetchContacts()

        wait(for: [expectation], timeout: 2)
    }
}
