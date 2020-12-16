//
//  Stoarge.swift
//  Homework2
//
//  Created by Sasha on 14/12/2020.
//

import Foundation

class Stoarge {
    
    var users: [User] = []
    
    static var share = Stoarge()
    private init() {
        users.append(User(name: "Олександр", password: "1111", userType: .admin))
        users.append(User(name: "Андрій", password: "1111", userType: .regular))
        let user = User(name: "Дмитро", password: "1111", userType: .regular)
        user.isBanned = true
        users.append(user)
    }
    
    func getRegularUsers() -> [User] {
        return users.filter { $0.userType == .regular }
    }
    
}
