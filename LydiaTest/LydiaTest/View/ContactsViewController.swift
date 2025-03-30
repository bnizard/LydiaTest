//
//  ContactsViewController.swift
//  LydiaTest
//
//  Created by Bastien Nizard on 29/03/2025.
//

import UIKit

class ContactsViewController: UIViewController {

    private let tableview = UITableView()
    private let viewModel = ContactsViewModel()
    private let activityIndicator = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupBindings()
        setupNavigationBar()
        viewModel.fetchContacts()
    }

    private func setupUI() {
        title = "Contacts"
        view.addSubview(tableview)

        // Setup TableView
        tableview.frame = view.bounds
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(ContactTableViewCell.self, forCellReuseIdentifier: "ContactCell")

        // Setup Activity Indicator
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
    }

    private func setupBindings() {
        viewModel.onUpdate =  { [weak self] in
            self?.tableview.reloadData()
        }

        viewModel.isLoading = { [weak self] isLoading in
            DispatchQueue.main.async {
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
    }

    // Set up the reload button in the navigation bar
    private func setupNavigationBar() {
        let reloadButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reloadContacts))
        navigationItem.rightBarButtonItem = reloadButton
    }

    // Action for the reload button
    @objc private func reloadContacts() {
        viewModel.fetchContacts()
    }
}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard indexPath.row < viewModel.contacts.count else {
           return UITableViewCell()
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as? ContactTableViewCell  else {
            return UITableViewCell()
        }

        cell.configure(with: viewModel.contacts[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard indexPath.row < viewModel.contacts.count else {
            return
        }

        let contact = viewModel.contacts[indexPath.row]
        let detailViewController = ContactDetailsViewController(contact: contact)
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}
