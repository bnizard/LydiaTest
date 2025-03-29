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
        tableview.frame = view.bounds
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(ContactTableViewCell.self, forCellReuseIdentifier: "ContactCell")
    }

    private func setupBindings() {
        viewModel.onUpdate =  { [weak self] in
            self?.tableview.reloadData()
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

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as? ContactTableViewCell  else {
            return UITableViewCell()
        }

        cell.configure(with: viewModel.contacts[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = viewModel.contacts[indexPath.row]
        let detailViewController = ContactDetailsViewController(contact: contact)
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}
