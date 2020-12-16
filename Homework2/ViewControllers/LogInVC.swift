//
//  ViewController.swift
//  Homework2
//
//  Created by Sasha on 14/12/2020.
//

import UIKit

class LogInVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    var authorizationService = AuthorizationService.share
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFileds()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }

    func setupTextFileds() {
        nameTextField.attributedPlaceholder = NSAttributedString(string:"Name", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
        passwordTextField.attributedPlaceholder = NSAttributedString(string:"Password", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
    }

    @IBAction func signInButtonTapped(_ sender: Any?) {
        guard let name = nameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        let alert = UIAlertController(title: "Authorization Error", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        do {
            let user = try authorizationService.logIn(name: name, password: password)
            if user.userType == .regular {
                let regularUserVC: RegularUserVC = .instantiate(from: .main)
                regularUserVC.bettingService = BettingService(currentUser: user)
                navigationController?.pushViewController(regularUserVC, animated: true)
            } else {
                let adminVC: AdminVC = .instantiate(from: .main)
                adminVC.adminService = AdminService(currentUser: user)
                navigationController?.pushViewController(adminVC, animated: true)
            }
        } catch AuthorizationError.userNotExist {
            alert.message = "User not exist"
            present(alert, animated: true)
            return
        } catch AuthorizationError.invalidPassword {
            alert.message = "Invalid Password"
            present(alert, animated: true)
            return
        } catch AuthorizationError.isBanned {
            alert.message = "User is banned"
            present(alert, animated: true)
            return
        } catch {
            alert.message = "Unhandled error"
            present(alert, animated: true)
            return
        }
        
    }
    
    @IBAction func registerButtonTapped(_ sender: Any?) {
        let registerVC: RegisterVC = .instantiate(from: .main)
        navigationController?.pushViewController(registerVC, animated: true)
    }

}

