//
//  ViewModel.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/5/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import Foundation

protocol ViewModelProtocol {

}

class ViewModel: ViewModelProtocol {
    let userRetriever: UserRetrieverProtocol
    
    init(userRetriever: UserRetrieverProtocol) {
        self.userRetriever = userRetriever
    }
}
