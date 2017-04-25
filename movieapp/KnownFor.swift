//
//  KnownFor.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation
import ObjectMapper

class KnownFor: Mappable {
    
     var POSTER_PATH: String?
     var ADULT: String?
     var OVERVIEW: String?
     var RELEASE_DATE: String?
     var ORIGINAL_TITLE: String?
     var GENRE_IDS: Array<Int>?
     var ID: Int?
     var MEDIA_TYPE: String?
     var ORIGINAL_LANGUAGE: String?
     var TITLE: String?
     var BACKDROP_PATH: String?
     var POPULARITY: Double?
     var VOTE_COUNT: Int?
     var VIDEO: String?
     var VOTE_AVERAGE: Double?
    
    func mapping(map: Map) {
        POSTER_PATH <- map["poster_path"]
        ADULT <- map["adult"]
        OVERVIEW <- map["overview"]
        RELEASE_DATE <- map["release_date"]
        GENRE_IDS <- map["genre_ids"]
        ID <- map["id"]
        MEDIA_TYPE <- map["media_type"]
        ORIGINAL_LANGUAGE <- map["original_language"]
        TITLE <- map["title"]
        BACKDROP_PATH <- map["backdrop_path"]
        POPULARITY <- map["popularity"]
        VOTE_COUNT <- map["vote_count"]
        VIDEO <- map["video"]
        VOTE_AVERAGE <- map["vote_average"]
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }


}
