//
//  User.swift
//  Homework2
//
//  Created by Sasha on 14/12/2020.
//

import Foundation

enum UserType {
    case regular
    case admin
}

class User {
    var name: String
    var password: String
    var bets: [String] = []
    var isBanned: Bool = false
    var userType: UserType
    
    init(name: String, password: String, userType: UserType) {
        self.name = name
        self.password = password
        self.userType = userType
    }
    
    var title: String {
        return name + (isBanned ? " (Banned)" : "")
    }
    
}
