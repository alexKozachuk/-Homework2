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
    private init() {}
    
    func getRegularUsers() -> [User] {
        return users.filter { $0.userType == .regular }
    }
    
    func getUser(by name: String) -> User? {
        return users.first(where: {$0.name == name})
    }
    
}

enum AuthorizationError: Error {
    case userNotExist
    case invalidPassword
    case isBanned
}

enum RegistrationError: Error {
    case nameIsBusy
}

class AuthorizationService {
    private var stoarge = Stoarge.share
    private var bettingSystem = BettingSystem.share
    
    static var share = AuthorizationService()
    private init() {}

    func logIn(name: String, password: String) throws {
        guard let user = stoarge.users.first(where: {$0.name == name}) else {
            throw AuthorizationError.userNotExist
        }
        guard user.password == password else {
            throw AuthorizationError.invalidPassword
        }
        guard user.isBanned == false else {
            throw AuthorizationError.isBanned
        }
        bettingSystem.currentUser = user
    }
    
    func registration(name: String, password: String, userType: UserType) throws {
        guard stoarge.users.first(where: {$0.name == name}) == nil else {
            throw RegistrationError.nameIsBusy
        }
        stoarge.users.append(User(name: name, password: password, userType: userType))
    }
    
    func logOut() {
        bettingSystem.currentUser = nil
    }
    
}

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
