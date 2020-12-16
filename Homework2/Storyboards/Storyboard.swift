//
//  Storyboard.swift
//  Homework2
//
//  Created by Sasha on 16/12/2020.
//

import UIKit

enum Storyboard: String {
    case main
    
    var instance: UIStoryboard {
        return UIStoryboard(name: rawValue.capitalized, bundle: nil)
    }
    
    func viewController<T: UIViewController>(viewControllerTypes: T.Type) -> T {
        let storyboardID = String(describing: viewControllerTypes)
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
    
}
