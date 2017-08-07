//
//  ViewModel.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/5/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import Foundation
import RxSwift

protocol ViewModelProtocol {
    var username: Variable<String?> { get }
}

class ViewModel: ViewModelProtocol {
    let username = Variable<String?>(nil)
    
    let userRetriever: UserRetrieverProtocol
    
    fileprivate let disposeBag = DisposeBag()
    
    init(userRetriever: UserRetrieverProtocol, user: UserProtocol) {
        self.userRetriever = userRetriever
        
        user.username.asObservable().subscribe(onNext: { [weak self] username in
            guard let _self = self else { return }
            _self.username.value = username
        }).addDisposableTo(disposeBag)
        
        startSession()
    }
    
    private func startSession() {
        userRetriever.getUser()
    }
}
