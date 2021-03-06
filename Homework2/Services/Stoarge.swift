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
        // For testing
        users.append(User(name: "Alex", password: "1111", userType: .admin))
        let andrii = User(name: "Andry", password: "1111", userType: .regular)
        andrii.bets = ["first bet", "second bet", "third bet"]
        users.append(andrii)
        let user = User(name: "Dima", password: "1111", userType: .regular)
        user.isBanned = true
        users.append(user)
    }
    
    var regularUsers: [User] {
        return users.filter { $0.userType == .regular }
    }
    
}
