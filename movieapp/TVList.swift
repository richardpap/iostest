//
//  TVList.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation
import ObjectMapper

class TVList: Mappable {

    var POSTER_PATH: String?
    var POPULARITY: Double?
    var ID: Int?
    var BACKDROP_PATH: String?
    var VOTE_AVERAGE: Double?
    var OVERVIEW: String?
    var FIRST_AIR_DATE: String?
    var ORIGIN_COUNTRY: Array<String>?
    var GENRE_IDS: Array<Int>?
    var ORIGINAL_LANGUAGE: String?
    var VOTE_COUNT: Int?
    var NAME: String?
    var ORIGINAL_NAME: String?

    func mapping(map: Map) {
        POSTER_PATH <- map["poster_path"]
        POPULARITY <- map["popularity"]
        ID <- map["id"]
        BACKDROP_PATH <- map["backdrop_path"]
        VOTE_AVERAGE <- map["vote_average"]
        OVERVIEW <- map["overview"]
        FIRST_AIR_DATE <- map["first_air_date"]
        ORIGIN_COUNTRY <- map["origin_country"]
        GENRE_IDS <- map["genre_ids"]
        ORIGINAL_LANGUAGE <- map["original_language"]
        VOTE_COUNT <- map["vote_count"]
        NAME <- map["name"]
        ORIGINAL_NAME <- map["original_name"]
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }
}

