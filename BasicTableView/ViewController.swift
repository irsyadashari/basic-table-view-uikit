//
//  ViewController.swift
//  BasicTableView
//
//  Created by Muh Irsyad Ashari on 10/12/24.
//

import UIKit

class ViewController: UIViewController {
    private var dummyDataSource: [String] = [
        "Data 1",
        "Data 2",
        "Data 3",
        "Data 4",
        "Data 5",
        "Data 6",
    ]
    
    private var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.addSubview(tableView)
        
        setupTableView()
    }
    
    private func setupTableView() {
        
        
        // Assign dataSource
        tableView.dataSource = self
        
        // Register a basic UITableViewCell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Ensures that the view does not automatically generate Auto Layout
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dummyDataSource[indexPath.row]
        return cell
    }
}

