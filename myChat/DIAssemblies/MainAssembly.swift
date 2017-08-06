//
//  MainAssembly.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/5/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import Foundation
import Swinject

class MainAssembly {
    static let conatiner = Container()
    
    static func Install() {
        
        conatiner.register(NetworkingProtocol.self) {
            _ in AlamofireWrapper()
        }
     
        conatiner.register(APIClientProtocol.self) {
            r in APIClient(networkAgent: r.resolve(NetworkingProtocol.self)!)
        }
        
    }
    
}
