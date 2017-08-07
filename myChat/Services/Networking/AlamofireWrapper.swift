//
//  AlamofireWrapper.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/5/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

protocol NetworkingProtocol {
    func requestAndResponseJSON(_ httpMethod: Alamofire.HTTPMethod, fullServerAddress: String, headers: [String:String], parameters: [String:Any], encoding: ParameterEncoding, completionHandler: @escaping (DataResponse<Any>) -> Void )
    
    func requestAndResponseObject<T: Mappable>(_ httpMethod: Alamofire.HTTPMethod, fullServerAddress: String,
                                  headers: [String:String], parameters: [String:Any], encoding: ParameterEncoding, completionHandler: @escaping (DataResponse<T>) -> Void)
}

class AlamofireWrapper: NetworkingProtocol {
    fileprivate let responseQueue = DispatchQueue(label: "lin.david.myChat.alamoResponseQueue", qos: .utility, attributes: [.concurrent])

    func requestAndResponseJSON(_ httpMethod: Alamofire.HTTPMethod, fullServerAddress: String, headers: [String:String], parameters: [String:Any], encoding: ParameterEncoding, completionHandler: @escaping (DataResponse<Any>) -> Void ) {
        Alamofire.request(fullServerAddress, method: httpMethod, parameters: parameters, encoding: encoding, headers: headers).responseJSON(queue: responseQueue, completionHandler: completionHandler)
    }
    
    func requestAndResponseObject<T: Mappable>(_ httpMethod: Alamofire.HTTPMethod, fullServerAddress: String, headers: [String:String], parameters: [String:Any], encoding: ParameterEncoding, completionHandler: @escaping (DataResponse<T>) -> Void) {
        Alamofire.request(fullServerAddress, method: httpMethod, parameters: parameters, encoding: encoding, headers: headers).responseObject(queue: responseQueue, completionHandler: completionHandler)
    }
}
