//
//  ViewController.swift
//  TableViewTests
//
//  Created by Abner Castro on 20/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var service: RemoteData?
    var tableArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        service?.getTableData(completion: { [weak self] array in
            DispatchQueue.main.async {
                self?.tableArray = array
                self?.tableView.reloadData()
            }
        })
    }
    
    private func configureView() {
        title = "Table View Tests"
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = tableArray[indexPath.row]
        return cell
    }
    
}

