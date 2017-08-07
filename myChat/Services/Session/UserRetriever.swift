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
    func getUser()
}

class UserRetriever: UserRetrieverProtocol {
    
    let apiClient: APIClientProtocol
    let user: UserProtocol
    
    fileprivate let disposeBag = DisposeBag()
    
    init(apiClient: APIClientProtocol, user: UserProtocol) {
        self.apiClient = apiClient
        self.user = user
    }
    
    func getUser() {
        apiClient.getUser().subscribe(onNext: { [weak self] userMappable in
            guard let _self = self else { return }
            guard let username = userMappable.included?[0].attributes?.username else { return }
            _self.user.username.value = username
        }).addDisposableTo(self.disposeBag)
    }
}
