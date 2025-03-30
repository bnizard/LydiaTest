//
//  ContactDetailViewController.swift
//  LydiaTest
//
//  Created by Bastien Nizard on 29/03/2025.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    private let contact: Contact
    private let imageView = UIImageView()
    private let tableView = UITableView()

    init(contact: Contact) {
        self.contact = contact
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        title = "\(contact.name.title) \(contact.name.first) \(contact.name.last)"
        view.backgroundColor = .white

        // Profile Image
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 64
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        if let url = URL(string: contact.picture.large) {
            downloadImage(from: url)
        }

        // TableView
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DetailsCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false

        // Add views to Main view
        view.addSubview(imageView)
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 128),
            imageView.heightAnchor.constraint(equalToConstant: 128),

            tableView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func downloadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}

// Tableview DataSource
extension ContactDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactDetails().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell", for: indexPath)
        cell.textLabel?.text = contactDetails()[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }

    private func contactDetails() -> [String] {

        // Format Dates
        let formattedDOB = displayDateFormatter.string(from: contact.dob.date)
        let formattedRegisteredDate = displayDateFormatter.string(from: contact.registered.date)

        return [
            "First Name: \(contact.name.first)",
            "Last Name: \(contact.name.last)",
            "Nationality: \(contact.nat)",
            "Gender: \(contact.gender)",
            "Age: \(contact.dob.age)",
            "Registered Date: \(formattedRegisteredDate)",
            "Username: \(contact.login.username)",
            "Password: \(contact.login.password)",
            "Address: \(contact.location.street.number) \(contact.location.street.name), \(contact.location.city), \(contact.location.state), \(contact.location.country)",
            "Postal Code: \(contact.location.postcode)",
            "Timezone: \(contact.location.timezone.description) \(contact.location.timezone.offset)",
            "Latitude: \(contact.location.coordinates.latitude)",
            "Longitude: \(contact.location.coordinates.longitude)",
            "Id: \(contact.id.name), \(contact.id.value ?? "N/A")",
            "Phone: \(contact.phone)",
            "Cell: \(contact.cell)",
            "Date of Birth: \(formattedDOB)"
        ]
    }
}
