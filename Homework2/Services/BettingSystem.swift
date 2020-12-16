//
//  BettingSystem.swift
//  Homework2
//
//  Created by Sasha on 16/12/2020.
//

import Foundation

class BettingSystem {
    
    private var stoarge = Stoarge.share
    var currentUser: User?
    
    static var share = BettingSystem()
    private init() {}
    
    func placeBet(bet: String) {
        guard let currentUser = currentUser else { return }
        guard currentUser.userType == .regular else { return }
        currentUser.bets.append(bet)
    }
    
    func getAllBets() -> [String]? {
        guard let currentUser = currentUser else { return nil }
        guard currentUser.userType == .regular else { return nil }
        return currentUser.bets
    }
    
    func getReguarUsers() -> [User]? {
        guard let currentUser = currentUser else { return nil }
        guard currentUser.userType == .admin else { return nil }
        return stoarge.getRegularUsers()
    }
    
    func banUser(user: User) {
        guard let currentUser = currentUser else { return }
        guard currentUser.userType == .admin else { return }
        user.isBanned = true
    }
    
    func unbanUser(user: User) {
        guard let currentUser = currentUser else { return }
        guard currentUser.userType == .admin else { return }
        user.isBanned = false
    }
    
}
