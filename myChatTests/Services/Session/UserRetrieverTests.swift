//
//  UserRetrieverTests.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/6/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import XCTest

class UserRetrieverTests: XCTestCase {
    
    let mockApiClient = MockAPIClient()
    let mockUserFactory = MockUserFactory()
    
    var userRetriever: UserRetrieverProtocol!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        userRetriever = UserRetriever(apiClient: mockApiClient, userFactory: mockUserFactory)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetUser() {
        XCTAssertTrue(true)
    }
    
}
