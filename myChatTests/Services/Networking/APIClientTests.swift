//
//  APIClientTests.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/6/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
import ObjectMapper

class APIClientTests: XCTestCase {
    
    let mockNetworkAgent = MockAlamofireWrapper()
    
    var apiClient: APIClientProtocol!
    
    var testScheduler: TestScheduler!
    let disposeBag = DisposeBag()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        apiClient = APIClient(networkAgent: mockNetworkAgent)

        testScheduler = TestScheduler(initialClock: 0)
        testScheduler.start()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetUser_UserMappableReturnedOnSuccess() {
        let testObserver = testScheduler.createObserver(UserMappable.self)
        
        let expectedUsername = "username"
        let json = ["included":[["attributes":["username":expectedUsername]]]]
        
        let map = Map(mappingType: .fromJSON, JSON: json)
        let mappable = UserMappable(map: map)
        
        mockNetworkAgent.responseObject = mappable
        
        apiClient.getUser().subscribe(testObserver).addDisposableTo(disposeBag)
        
        XCTAssertEqual(expectedUsername, testObserver.events.first?.value.element?.included?[0].attributes?.username)
    }
    
    func testGetUser_ErrorReturnedOnMalformedResponse()  {
        let testObserver = testScheduler.createObserver(UserMappable.self)
        
        let json = ["included":[["attributes":[:]]]]
        
        let map = Map(mappingType: .fromJSON, JSON: json)
        let mappable = UserMappable(map: map)
        
        mockNetworkAgent.responseObject = mappable
        
        apiClient.getUser().subscribe(testObserver).addDisposableTo(disposeBag)
        
        XCTAssertEqual(999, (testObserver.events.first?.value.error as NSError?)?.code)
        XCTAssertEqual("NSError", (testObserver.events.first?.value.error as NSError?)?.domain)
    }
    
}
