//
//  UserFactory.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/6/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import Foundation

protocol UserFactoryProtocol {
    func createUser(with username: String) -> UserProtocol
}

class UserFactory: UserFactoryProtocol {
    init() {}
    func createUser(with username: String) -> UserProtocol {
        return User(username: username)
    }
}
