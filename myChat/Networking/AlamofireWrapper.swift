//
//  AlamofireWrapper.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/5/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkingProtocol {
    func requestAndResponseJSON(_ httpMethod: Alamofire.HTTPMethod, fullServerAddress: String,
                                headers: [String:String], parameters: [String:Any], encoding: ParameterEncoding, completionHandler: @escaping (DataResponse<Any>) -> Void )
}

class AlamofireWrapper: NetworkingProtocol {
    fileprivate let responseQueue = DispatchQueue(label: "lin.david.myChat.alamoResponseQueue", qos: .utility, attributes: [.concurrent])
    
    init() {
    }

    func requestAndResponseJSON(_ httpMethod: Alamofire.HTTPMethod, fullServerAddress: String,
                                headers: [String:String], parameters: [String:Any], encoding: ParameterEncoding, completionHandler: @escaping (DataResponse<Any>) -> Void ) {
        Alamofire.request(fullServerAddress, method: httpMethod, parameters: parameters, encoding: encoding, headers: headers).responseJSON(queue: responseQueue, completionHandler: completionHandler)
    }
}
