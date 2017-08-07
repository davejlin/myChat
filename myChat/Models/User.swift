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
}

class UserMappable: Mappable {
    var included: [IncludedMappable]?
    
    init(with username: String?) {
        self.included = [IncludedMappable(with: username)]
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }

    func mapping(map: Map) {
        included <- map["included"]
    }
}

class IncludedMappable: Mappable {
    var attributes: AttributesMappable?
    
    init(with username: String?) {
        self.attributes = AttributesMappable(with: username)
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        attributes <- map["attributes"]
    }
}

class AttributesMappable: Mappable {
    var username: String?
    
    init(with username: String?) {
        self.username = username
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        username <- map["username"]
    }
}
