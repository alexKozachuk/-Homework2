//
//  AdminService.swift
//  Homework2
//
//  Created by Sasha on 16/12/2020.
//

import Foundation

class AdminService {
    
    var currentUser: User
    
    private var stoarge = Stoarge.share
    
    init(currentUser: User) {
        self.currentUser = currentUser
    }
    
    var regularUsers: [User] {
        return stoarge.regularUsers
    }
    
    func banUser(user: User) {
        user.isBanned = true
    }
    
    func unbanUser(user: User) {
        user.isBanned = false
    }
}
