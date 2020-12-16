//
//  DetailVC.swift
//  Homework2
//
//  Created by Sasha on 16/12/2020.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.register(type: BasicTableViewCell.self)
    }
    
    @IBAction func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension DetailVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(with: BasicTableViewCell.self, for: indexPath)
        cell.nameLabel.text = item
        return cell
    }
    
}
