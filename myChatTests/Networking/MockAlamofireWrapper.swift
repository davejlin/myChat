//
//  MockAlamofireWrapper.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/5/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import Foundation
import Alamofire

class MockAlamofireWrapper: NetworkingProtocol {
    
    func requestAndResponseJSON(_ httpMethod: Alamofire.HTTPMethod, fullServerAddress: String,
                                headers: [String:String], parameters: [String:Any], encoding: ParameterEncoding, completionHandler: @escaping (DataResponse<Any>) -> Void ) {
        
    }
}
