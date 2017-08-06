//
//  MainAssembly.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/5/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup() {
        let container = SwinjectStoryboard.defaultContainer
        
        container.register(NetworkingProtocol.self) {
            _ in AlamofireWrapper()
        }
        
        container.register(UserFactoryProtocol.self) {
            _ in UserFactory()
        }
        
        container.register(APIClientProtocol.self) {
            r in APIClient(networkAgent: r.resolve(NetworkingProtocol.self)!)
        }
        
        container.register(UserRetrieverProtocol.self) {
            r in UserRetriever(apiClient: r.resolve(APIClientProtocol.self)!, userFactory: r.resolve(UserFactoryProtocol.self)!)
        }
        
        container.register(ViewModelProtocol.self) {
            r in ViewModel(userRetriever: r.resolve(UserRetrieverProtocol.self)!)
        }
        
        container.storyboardInitCompleted(ViewController.self) { r, c in
            c.viewModel = r.resolve(ViewModelProtocol.self)!
        }
        
    }
    
}
