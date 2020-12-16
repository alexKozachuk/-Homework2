//
//  AuthorizationService.swift
//  Homework2
//
//  Created by Sasha on 16/12/2020.
//

import Foundation

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
