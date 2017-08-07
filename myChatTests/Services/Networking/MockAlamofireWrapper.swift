//
//  MockAlamofireWrapper.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/5/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class MockAlamofireWrapper: NetworkingProtocol {
    
    var responseObject: Mappable?
    var responseError: NSError?
    var request: URLRequest
    var response: HTTPURLResponse?
    var result: Result<Any>!
    var data: Data? = nil
    var statusCode = 201
    
    init() {
        let url = "url"
        request = URLRequest(url: URL(fileURLWithPath: url))
        result = Result.success(NSDictionary())
        response = HTTPURLResponse(url: URL(fileURLWithPath: url), statusCode: statusCode, httpVersion: nil, headerFields: nil)
    }
    
    func requestAndResponseJSON(_ httpMethod: Alamofire.HTTPMethod, fullServerAddress: String, headers: [String:String], parameters: [String:Any], encoding: ParameterEncoding, completionHandler: @escaping (DataResponse<Any>) -> Void ) {
        
    }
    
    func requestAndResponseObject<T: Mappable>(_ httpMethod: Alamofire.HTTPMethod, fullServerAddress: String, headers: [String:String], parameters: [String:Any], encoding: ParameterEncoding, completionHandler: @escaping (DataResponse<T>) -> Void) {
        let objectResponse: DataResponse<T> = createResponse()
        completionHandler(objectResponse)
    }
    
    func createResponse<T: Mappable>() -> DataResponse<T> {
        var result: Result<T>
        
        if let error = responseError {
            result = Result<T>.failure(error)
        } else {
            if let _responseObject = responseObject as? T {
                result = Result<T>.success(_responseObject)
            } else {
                result = Result<T>.failure(NSError(domain: "NSError", code: 999, userInfo: nil))
            }
        }
        
        return DataResponse(request: request, response: response, data: data, result: result)
    }
}
