//
//  UserRetriever.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/6/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import Foundation

protocol UserRetrieverProtocol {
    func getUser() -> UserProtocol?
}

class UserRetriever: UserRetrieverProtocol {
    
    let apiClient: APIClientProtocol
    let userFactory: UserFactoryProtocol
    
    init(apiClient: APIClientProtocol, userFactory: UserFactoryProtocol) {
        self.apiClient = apiClient
        self.userFactory = userFactory
    }
    
    func getUser() -> UserProtocol? {
        return nil
    }
}
