//
//  User.swift
//  myChat
//
//  Created by Lin David, US-20 on 8/6/17.
//  Copyright © 2017 Lin David, US-20. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper

protocol UserProtocol: class {
    var username: Variable<String?> { get }
}

class User: UserProtocol {
    let username = Variable<String?>(nil)
    
    init(username: String) {
        self.username.value = username
    }
}

class UserMappable: Mappable {
    var included: [IncludedMappable]?
    
    required init?(map: Map) {
        mapping(map: map)
    }

    func mapping(map: Map) {
        included <- map["included"]
    }
}

class IncludedMappable: Mappable {
    var attributes: AttributesMappable?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        attributes <- map["attributes"]
    }
}

class AttributesMappable: Mappable {
    var username: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        username <- map["username"]
    }
}
