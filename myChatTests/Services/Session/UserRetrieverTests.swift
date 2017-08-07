//
//  UserRetrieverTests.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/6/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import XCTest
import RxSwift
import RxTest

class UserRetrieverTests: XCTestCase {
    
    let mockApiClient = MockAPIClient()
    let mockUser = MockUser()
    
    var userRetriever: UserRetrieverProtocol!
    
    var testScheduler: TestScheduler!
    let disposeBag = DisposeBag()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        userRetriever = UserRetriever(apiClient: mockApiClient, user: mockUser)
        
        testScheduler = TestScheduler(initialClock: 0)
        testScheduler.start()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetUserUpdatesUsername() {
        let testObserver = testScheduler.createObserver(String?.self)
        mockUser.username.asObservable().subscribe(testObserver).addDisposableTo(disposeBag)
        
        let expectedUsername = "username"
        mockApiClient.userMappableToReturn = UserMappable(with: expectedUsername)
        
        userRetriever.getUser()
        
        XCTAssertEqual(expectedUsername, testObserver.events.last?.value.element!, "should update username")
    }
    
}
