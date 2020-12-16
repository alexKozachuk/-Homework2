//
//  AdminVC.swift
//  Homework2
//
//  Created by Sasha on 16/12/2020.
//

import Foundation

import UIKit

// Add ban users

class AdminVC: UIViewController {
    
    var adminService: AdminService!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func logOutButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension AdminVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = adminService.regularUsers[indexPath.row]
        print(item.bets)
        tableView.deselectRow(at: indexPath, animated: true)
        // add tableView
    }
    
}

extension AdminVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adminService.regularUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = adminService.regularUsers[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = item.name
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        return cell
    }
    
}



