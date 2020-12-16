//
//  Extension+Core.swift
//  Homework2
//
//  Created by Sasha on 16/12/2020.
//

import UIKit


// MARK: - UIView
extension UIView {
    static var name: String {
        return String(describing: self)
    }
}

// MARK: - UITableView
extension UITableView {
    
    func register(type: UITableViewCell.Type) {
        let typeName = type.name
        let nib = UINib(nibName: typeName, bundle: nil)
        self.register(nib, forCellReuseIdentifier: typeName)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.name, for: indexPath) as! T
    }

}

// MARK: - UIViewController

extension UIViewController {
    
    static func instantiate<T: UIViewController>(from storyboard: Storyboard) -> T {
        return storyboard.viewController(viewControllerTypes: T.self)
    }
    
}
