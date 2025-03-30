//
//  ContactDetailViewController.swift
//  LydiaTest
//
//  Created by Bastien Nizard on 29/03/2025.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    private let viewModel: ContactDetailsViewModel
    private let imageView = UIImageView()
    private let tableView = UITableView()

    init(contact: Contact) {
        self.viewModel = ContactDetailsViewModel(contact: contact)
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
        title = "\(viewModel.contact.name.title) \(viewModel.contact.name.first) \(viewModel.contact.name.last)"
        view.backgroundColor = .white

        // Profile Image
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 64
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        if let url = URL(string: viewModel.contact.picture.large) {
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

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.contactDetails().count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let contactDetails = viewModel.contactDetails()
        guard section < contactDetails.count else {
            return 0
        }

        return contactDetails[section].details.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactDetails = viewModel.contactDetails()

        guard indexPath.section < contactDetails.count else {
            return UITableViewCell()
        }

        let sectionDetails = contactDetails[indexPath.section].details
        guard indexPath.row < sectionDetails.count else {
            return UITableViewCell()
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell", for: indexPath)
        cell.textLabel?.text = sectionDetails[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let contactDetails = viewModel.contactDetails()
        guard section < contactDetails.count else {
            return nil
        }

        return contactDetails[section].section
    }
}
