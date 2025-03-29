//
//  ContactTableViewCell.swift
//  LydiaTest
//
//  Created by Bastien Nizard on 29/03/2025.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    private let nameLabel: UILabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(nameLabel)

        // Disable autoresizing mask to use Auto Layout
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        // Set Auto Layout constraints to center the label
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with contact: Contact) {
        nameLabel.text = "\(contact.name.first) \(contact.name.last)"
    }
}
