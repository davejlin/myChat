//
//  APIClient.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/5/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

protocol APIClientProtocol {
    func getUser() -> Observable<UserMappable?>
}

class APIClient: APIClientProtocol {
    
    let networkAgent: NetworkingProtocol
    private typealias Const = APIConstants
    var headers = [String:String]()
    
    init(networkAgent: NetworkingProtocol) {
        self.networkAgent = networkAgent
        createHeaders()
    }
    
    func getUser() -> Observable<UserMappable?> {
        let fullAddress = Const.GET_USER_URL + Const.GET_USER_ENDPOINT
        let httpMethod = Alamofire.HTTPMethod.post

        return Observable.create { [weak self] observer in
            guard let _self = self else { return Disposables.create() }
            _self.networkAgent.requestAndResponseObject(httpMethod, fullServerAddress: fullAddress, headers: _self.headers, parameters: [:], encoding: JSONEncoding.default) { (response : DataResponse<UserMappable>)  in
                
                switch response.result {
                case .failure(let error):
                    observer.onError(error)
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
    
    private func createHeaders() {
        headers[Const.HEADER_CONTENT_TYPE_KEY] = Const.HEADER_CONTENT_TYPE_VALUE
        headers[Const.HEADER_ACCEPT_KEY]       = Const.HEADER_ACCEPT_VALUE
    }
}

struct APIConstants {
    static let GET_USER_URL = "https://private-anon-40f8f32822-orachallenge.apiary-mock.com/"
    static let GET_USER_ENDPOINT = "api/v1/sessions"
    
    static let HEADER_CONTENT_TYPE_KEY = "Content-Type"
    static let HEADER_ACCEPT_KEY = "Accept"
    
    static let HEADER_CONTENT_TYPE_VALUE = "application/vnd.api+json"
    static let HEADER_ACCEPT_VALUE = "application/vnd.api+json"
}
