//
//  UserFactoryTests.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/6/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import XCTest

class UserFactoryTests: XCTestCase {
    
    let userFactory: UserFactoryProtocol = UserFactory()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreateUserReturnsUserProtocolObject() {
        let expectedName = "name"
        let actualUser = userFactory.createUser(with: expectedName)
        
        XCTAssertTrue((actualUser as Any) is UserProtocol, "instance should be UserProtocol")
        XCTAssertEqual(expectedName, actualUser.username.value, "username should be assigned")
    }
}
