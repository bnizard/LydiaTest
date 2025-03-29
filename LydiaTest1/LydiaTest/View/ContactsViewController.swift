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

        print("✅ viewDidLoad called")

        view.backgroundColor = .white

        setupUI()
        setupBindings()
        viewModel.fetchContacts()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("🎬 viewDidAppear called")
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
}
