//
//  ContactsAPIServiceTests.swift
//  LydiaTestTests
//
//  Created by Bastien Nizard on 30/03/2025.
//

import XCTest

@testable import LydiaTest

class ContactsAPIServiceTests: XCTestCase {
    func testFetchContactsSuccess() {
        let expectation = XCTestExpectation(description: "Fetch contacts success")

        let url = URL(string: "https://randomuser.me/api/?results=10")!

        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            XCTAssertNil(error, "Request should not return an error")
            XCTAssertNotNil(data, "Response data should not be nil")

            do {
                let decoder = JSONDecoder()
                let apiResponse = try decoder.decode(APIResponse.self, from: data!)
                XCTAssertEqual(apiResponse.results.count, 10, "Should return 10 contacts")
            } catch {
                XCTFail("Failed to decode JSON: \(error.localizedDescription)")
            }

            expectation.fulfill()
        }

        dataTask.resume()

        wait(for: [expectation], timeout: 5)
    }
}
