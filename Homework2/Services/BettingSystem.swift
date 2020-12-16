//
//  BettingSystem.swift
//  Homework2
//
//  Created by Sasha on 16/12/2020.
//

import Foundation

class BettingService {
    
    var currentUser: User
    
    init(currentUser: User) {
        self.currentUser = currentUser
    }
    
    func placeBet(bet: String) {
        currentUser.bets.append(bet)
    }
    
    func getAllBets() -> [String] {
        return currentUser.bets
    }
    
}
// private var stoarge = Stoarge.share
//func getReguarUsers() -> [User]? {
//    guard currentUser.userType == .admin else { return nil }
//    return stoarge.getRegularUsers()
//}
//
//func banUser(user: User) {
//    guard currentUser.userType == .admin else { return }
//    user.isBanned = true
//}
//
//func unbanUser(user: User) {
//    guard currentUser.userType == .admin else { return }
//    user.isBanned = false
//}
