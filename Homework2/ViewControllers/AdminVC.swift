//
//  AdminVC.swift
//  Homework2
//
//  Created by Sasha on 16/12/2020.
//

import Foundation

import UIKit

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
        let item = adminService.regularUsers[indexPath.row].bets
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC: DetailVC = .instantiate(from: .main)
        detailVC.dataSource = item
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension AdminVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let user = adminService.regularUsers[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] (_, _, completionHandler) in
            self?.adminService.banUser(user: user)
            self?.tableView.reloadData()
            completionHandler(true)
        }
        deleteAction.title = "Ban"
        deleteAction.backgroundColor = .systemRed
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let user = adminService.regularUsers[indexPath.row]
        let deleteAction = UIContextualAction(style: .normal, title: nil) { [weak self] (_, _, completionHandler) in
            self?.adminService.unbanUser(user: user)
            self?.tableView.reloadData()
            completionHandler(true)
        }
        deleteAction.title = "Unban"
        deleteAction.backgroundColor = .systemGreen
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adminService.regularUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = adminService.regularUsers[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = item.title
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        return cell
    }
    
}



