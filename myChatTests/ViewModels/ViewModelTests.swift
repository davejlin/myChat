//
//  ViewModelTests.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/6/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import XCTest
import RxSwift
import RxTest

class ViewModelTests: XCTestCase {
    
    let mockUserRetriever = MockUserRetriever()
    let mockUser = MockUser()
    
    var viewModel: ViewModelProtocol!
    
    var testScheduler: TestScheduler!
    let disposeBag = DisposeBag()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = ViewModel(userRetriever: mockUserRetriever, user: mockUser)

        testScheduler = TestScheduler(initialClock: 0)
        testScheduler.start()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUsernameIsUpdated() {
        let testObserver = testScheduler.createObserver(String?.self)
        viewModel.username.asObservable().subscribe(testObserver).addDisposableTo(disposeBag)
        let expectedUsername = "my username"
        mockUser.username.value = expectedUsername
        XCTAssertEqual(expectedUsername, testObserver.events.last?.value.element!, "should update username")
    }
    
    func testGetUserIsCalledOnInitialization() {
        XCTAssertTrue(mockUserRetriever.getUserCalled, "should call getUser on init")
    }
}
