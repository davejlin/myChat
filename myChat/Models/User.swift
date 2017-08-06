//
//  User.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/6/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import Foundation
import RxSwift

protocol UserProtocol: class {
    var username: Variable<String?> { get }
}

class User: UserProtocol {
    let username = Variable<String?>(nil)
    
    init(username: String) {
        self.username.value = username
    }
}
