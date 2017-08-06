//
//  UserRetriever.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/6/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import Foundation
import RxSwift

protocol UserRetrieverProtocol {
    func getUser() -> Observable<UserProtocol?>
}

class UserRetriever: UserRetrieverProtocol {
    
    let apiClient: APIClientProtocol
    let userFactory: UserFactoryProtocol
    
    fileprivate let disposeBag = DisposeBag()
    
    init(apiClient: APIClientProtocol, userFactory: UserFactoryProtocol) {
        self.apiClient = apiClient
        self.userFactory = userFactory
    }
    
    func getUser() -> Observable<UserProtocol?> {
        return Observable.create { [weak self] observer in
            guard let _self = self else { return Disposables.create() }
            _self.apiClient.getUser().subscribe(onNext: { userMappable in
                guard let _self = self else { return }
                guard let username = userMappable?.included?[0].attributes?.username else { return }
                observer.onNext(_self.userFactory.createUser(with: username))
            }).addDisposableTo(_self.disposeBag)
            return Disposables.create()
        }
    }
}
