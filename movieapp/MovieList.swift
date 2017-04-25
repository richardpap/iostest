//
//  MovieItem.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 10..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieList: Mappable {
    
    var GENRE_IDS: Array<Int>?
    var ADULT: String?
    var ID: Int?
    var ORIGINAL_TITLE: String?
    var BACKDROP_PATH: String?
    var VOTE_AVERAGE: Double?
    var POPULARITY: Double?
    var POSTER_PATH: String?
    var OVERVIEW: String?
    var TITLE: String?
    var ORIGINAL_LANGUAGE: String?
    var VOTE_COUNT: Int?
    var RELEASE_DATE: String?
    var VIDEO: String?
    
    
    func mapping(map: Map) {
        GENRE_IDS <- map["genre_ids"]
        ADULT <- map["adult"]
        ID <- map["id"]
        ORIGINAL_TITLE <- map["original_title"]
        BACKDROP_PATH <- map["backdrop_path"]
        VOTE_AVERAGE <- map["vote_average"]
        POPULARITY <- map["popularity"]
        POSTER_PATH <- map["poster_path"]
        OVERVIEW <- map["overview"]
        TITLE <- map["title"]
        ORIGINAL_LANGUAGE <- map["original_language"]
        VOTE_COUNT <- map["vote_count"]
        RELEASE_DATE <- map["release_date"]
        VIDEO <- map["video"]
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }
}
