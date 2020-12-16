//
//  RegisterVC.swift
//  Homework2
//
//  Created by Sasha on 16/12/2020.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userTypeSwitch: UISwitch!
    @IBOutlet weak var applyButton: UIButton!
    
    var authorizationService = AuthorizationService.share
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFileds()
    }
    
    func setupTextFileds() {
        nameTextField.attributedPlaceholder = NSAttributedString(string:"Name", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
        passwordTextField.attributedPlaceholder = NSAttributedString(string:"Password", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
    }
    
    @IBAction func backButtonTapped(_ sender: Any?) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func applyButtonTapped(_ swnder: Any? ) {
        guard let name = nameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard name != "" || password != "" else { return }
        let userType: UserType = userTypeSwitch.isOn ? .admin : .regular
        
        let alert = UIAlertController(title: "Registration Error", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        do {
            try authorizationService.registration(name: name, password: password, userType: userType)
            navigationController?.popViewController(animated: true)
        } catch RegistrationError.nameIsBusy {
            alert.message = "Name Is Busy"
            present(alert, animated: true)
            return
        } catch {
            alert.message = "Unhandled error"
            present(alert, animated: true)
            return
        }
        
    }
    
    @IBAction func textFieldValueChanged(_ sender: Any?) {
        guard let name = nameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        if name == "" || password == "" {
            applyButton.isEnabled = false
            applyButton.alpha = 0.7
        } else {
            applyButton.isEnabled = true
            applyButton.alpha = 1
        }
    }
    
}
