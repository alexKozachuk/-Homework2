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
    
    var bets: [String] {
        return currentUser.bets
    }
    
}

