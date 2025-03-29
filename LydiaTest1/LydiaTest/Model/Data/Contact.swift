//
//  Contact.swift
//  LydiaTest
//
//  Created by Bastien Nizard on 29/03/2025.
//

import Foundation

struct Contact: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob: DOB
    let registered: Registered
    let phone: String
    let cell: String
    let id: ID
    let picture: Picture
    let nat: String
}
