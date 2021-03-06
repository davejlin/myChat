//
//  MockUserRetriever.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/6/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import Foundation
import RxSwift

class MockUserRetriever: UserRetrieverProtocol {
    
    var userToReturn: UserProtocol? = nil
    var getUserCalled = false
    
    func getUser() {
        getUserCalled = true
    }

}
