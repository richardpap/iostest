//
//  PeopleDetail.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation
import ObjectMapper

class PeopleDetails: Mappable {
    var ADULT: String?
    var ALSO_KNOWN_AS: Array<String>?
    var BIOGRAPHY: String?
    var BIRTHDAY: String?
    var DEATHDAY: String?
    var GENDER: Int?
    var HOMEPAGE: String?
    var ID: Int?
    var IMDB_ID: String?
    var NAME: String?
    var PLACE_OF_BIRTH: String?
    var POPULARITY: Double?
    var PROFILE_PATH: String?
    
    func mapping(map: Map) {
        ADULT <- map["adult"]
        ALSO_KNOWN_AS <- map["also_known_as"]
        BIOGRAPHY <- map["biography"]
        BIRTHDAY <- map["birthday"]
        DEATHDAY <- map["deathday"]
        GENDER <- map["gender"]
        HOMEPAGE <- map["homepage"]
        ID <- map["id"]
        NAME <- map["name"]
        POPULARITY <- map["popularity"]
        PLACE_OF_BIRTH <- map["place_of_birth"]
        POPULARITY <- map["popularity"]
        PROFILE_PATH <- map["profile_path"]
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }

}
