//
//  PeopleList.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation
import ObjectMapper

class PeopleList: Mappable {
    
    var PROFILE_PATH: String?
    var ADULT: String?
    var ID: Int?
    var KNOWN_FOR: Array<KnownFor>?
    var NAME: String?
    var POPULARITY: Double?
    
    
    func mapping(map: Map) {
        PROFILE_PATH <- map["profile_path"]
        ADULT <- map["adult"]
        ID <- map["id"]
        KNOWN_FOR <- map["known_for"]
        NAME <- map["name"]
        POPULARITY <- map["popularity"]
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }
}

