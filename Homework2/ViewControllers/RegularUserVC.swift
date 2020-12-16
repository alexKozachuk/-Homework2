//
//  RegularUserVC.swift
//  Homework2
//
//  Created by Sasha on 16/12/2020.
//

import UIKit

class RegularUserVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var bettingService: BettingService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.register(type: BasicTableViewCell.self)
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any?) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func AddButtonTapped(_ sender: Any?) {
        let alertController = UIAlertController(title: "Add new bet", message: nil, preferredStyle: .alert)
        alertController.addTextField()
        let submitAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            guard let answer = alertController.textFields?[0] else { return }
            guard let text = answer.text else { return }
            self?.bettingService.placeBet(bet: text)
            self?.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(submitAction)
        
        present(alertController, animated: true)
        
    }
    
    
}

extension RegularUserVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bettingService.bets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = bettingService.bets[indexPath.row]
        let cell = tableView.dequeueReusableCell(with: BasicTableViewCell.self, for: indexPath)
        cell.nameLabel.text = item
        return cell
    }
    
    
}

