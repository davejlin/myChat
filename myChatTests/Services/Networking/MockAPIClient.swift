//
//  MockAPIClient.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/5/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import Foundation
import RxSwift

class MockAPIClient: APIClientProtocol {
    
    var userMappableToReturn = UserMappable(with: "username")
    
    func getUser() -> Observable<UserMappable> {
        return Observable.create { observer in
            observer.onNext(self.userMappableToReturn)
            return Disposables.create()
        }
    }
}
