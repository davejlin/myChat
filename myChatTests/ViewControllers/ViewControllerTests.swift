//
//  ViewControllerTests.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/6/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import XCTest
import Swinject

class ViewControllerTests: XCTestCase {
    
    let container = Container()
    let mockViewModel = MockViewModel()
    var viewController: UIViewController!
    
    override func setUp() {
        super.setUp()
        
        container.register(ViewModelProtocol.self) {
            r in
            self.mockViewModel
        }
        container.register(ViewController.self) { r in
            let vc = ViewController()
            vc.viewModel = r.resolve(ViewModelProtocol.self)
            return vc
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        XCTAssertTrue(true)
    }
}
