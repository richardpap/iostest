//
//  TVDetails.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation
import ObjectMapper

struct TVDetails: Mappable {

    var BACKDROP_PATH: String?
    var CREATED_BY: Array<AnyObject>?
    var EPISODE_RUN_TIME: Array<Int>?
    var FIRST_AIR_DATE: String?
    var GENRES: Array<DetailGenre>?
    var HOMEPAGE: String?
    var ID: Int?
    var IN_PRODUCTION: String?
    var LANGUAGES: Array<String>?
    var LAST_AIR_DATE: String?
    var NAME: String?
    var NETWORKS: Array<AnyObject>?
    var NUMBER_OF_EPISODES: Int?
    var NUMBER_OF_SEASONS: Int?
    var ORIGIN_COUNTRY: Array<String>?
    var ORIGINAL_LANGUAGE: String?
    var ORIGINAL_NAME: String?
    var OVERVIEW: String?
    var POPULARITY: Double?
    var POSTER_PATH: String?
    var PRODUCTION_COMPANIES: Array<AnyObject>?
    var SEASONS: Array<AnyObject>?
    var STATUS: String?
    var TYPE: String?
    var VOTE_AVERAGE: Double?
    var VOTE_COUNT: Int?

    mutating func mapping(map: Map) {
        BACKDROP_PATH <- map["backdrop_path"]
        CREATED_BY <- map["created_by"]
        EPISODE_RUN_TIME <- map["episode_run_time"]
        FIRST_AIR_DATE <- map["first_air_date"]
        GENRES <- map["genres"]
        HOMEPAGE <- map["homepage"]
        ID <- map["id"]
        IN_PRODUCTION <- map["in_production"]
        LANGUAGES <- map["languages"]
        LAST_AIR_DATE <- map["last_air_date"]
        NAME <- map["name"]
        NETWORKS <- map["networks"]
        NUMBER_OF_EPISODES <- map["number_of_episodes"]
        NUMBER_OF_SEASONS <- map["number_of_seasons"]
        ORIGIN_COUNTRY <- map["origin_country"]
        ORIGINAL_LANGUAGE <- map["original_language"]
        ORIGINAL_NAME <- map["original_name"]
        OVERVIEW <- map["overview"]
        POPULARITY <- map["popularity"]
        POSTER_PATH <- map["poster_path"]
        PRODUCTION_COMPANIES <- map["production_companies"]
        SEASONS <- map["seasons"]
        STATUS <- map["status"]
        TYPE <- map["type"]
        VOTE_AVERAGE <- map["vote_average"]
        VOTE_COUNT <- map["vote_count"]
    }
    
    init?(map: Map) {
        mapping(map: map)
    }
}
