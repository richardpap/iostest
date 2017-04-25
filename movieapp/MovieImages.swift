//
//  Config.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 11..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieImages: Mappable {
    
    var BASE_URL: String?
    var SECURE_BASE_URL: String?
    var BACKDROP_SIZES: Array<String>?
    var LOGO_SIZES: Array<String>?
    var POSTER_SIZES: Array<String>?
    var PROFILE_SIZES: Array<String>?
    var STILL_SIZES: Array<String>?
    var CHANGE_KEYS: Array<String>?

    func mapping(map: Map) {
        BASE_URL <- map["base_url"]
        SECURE_BASE_URL <- map["secure_base_url"]
        BACKDROP_SIZES <- map["backdrop_sizes"]
        LOGO_SIZES <- map["logo_sizes"]
        POSTER_SIZES <- map["poster_Sizes"]
        PROFILE_SIZES <- map["profile_sizes"]
        STILL_SIZES <- map["still_sizes"]
        CHANGE_KEYS <- map["change_keys"]
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }
}
