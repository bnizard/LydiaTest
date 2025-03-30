//
//  ContactDetailsViewModel.swift
//  LydiaTest
//
//  Created by Bastien Nizard on 30/03/2025.
//

import Foundation

class ContactDetailsViewModel {
    let contact: Contact

    init(contact: Contact) {
        self.contact = contact
    }

    func contactDetails() -> [(section: String, details: [String])] {
        // Format Dates
        let formattedDOB = displayDateFormatter.string(from: contact.dob.date)
        let formattedRegisteredDate = displayDateFormatter.string(from: contact.registered.date)

        return [
            ("Personal Info", [
                "First Name: \(contact.name.first)",
                "Last Name: \(contact.name.last)",
                "Gender: \(contact.gender)",
                "Nationality: \(contact.nat)",
                "Age: \(contact.dob.age)",
                "Date of Birth: \(formattedDOB)"
            ]),
            ("Account Info", [
                "Username: \(contact.login.username)",
                "Password: \(contact.login.password)",
                "Registered Date: \(formattedRegisteredDate)"
            ]),
            ("Contact Info", [
                "Phone: \(contact.phone)",
                "Cell: \(contact.cell)"
            ]),
            ("Address", [
                "Street: \(contact.location.street.number) \(contact.location.street.name)",
                "City: \(contact.location.city)",
                "State: \(contact.location.state)",
                "Country: \(contact.location.country)",
                "Postal Code: \(contact.location.postcode)",
                "Timezone: \(contact.location.timezone.description) \(contact.location.timezone.offset)"
            ]),
            ("Location", [
                "Latitude: \(contact.location.coordinates.latitude)",
                "Longitude: \(contact.location.coordinates.longitude)"
            ]),
            ("Identification", [
                "ID: \(contact.id.name), \(contact.id.value ?? "N/A")"
            ])
        ]
    }
}
