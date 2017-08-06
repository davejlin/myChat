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
    var currentUserName: Variable<String?> { get }
}

class ViewModel: ViewModelProtocol {
    let currentUserName = Variable<String?>(nil)
    
    let userRetriever: UserRetrieverProtocol
    
    fileprivate let disposeBag = DisposeBag()
    
    init(userRetriever: UserRetrieverProtocol) {
        self.userRetriever = userRetriever
        startSession()
    }
    
    private func startSession() {
        userRetriever.getUser().subscribe( onNext: { [weak self] user in
            guard let _self = self else { return }
            guard let user = user else { return }
            _self.currentUserName.value = user.username.value
        }).addDisposableTo(disposeBag)
    }
}
