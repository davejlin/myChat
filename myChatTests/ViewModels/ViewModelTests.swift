//
//  ViewModelTests.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/6/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import XCTest

class ViewModelTests: XCTestCase {
    
    let mockUserRetriever = MockUserRetriever()
    let mockUser = MockUser()
    
    var viewModel: ViewModelProtocol!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = ViewModel(userRetriever: mockUserRetriever, user: mockUser)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test() {
        XCTAssertTrue(true)
    }
    
}
