//
//  movieDetails.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 12..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation
import ObjectMapper

struct MovieDetails: Mappable {
    
    
    var ADULT: String?
    var BACKDROP_PATH: String?
    var BELONGS_TO_COLLECTION: AnyObject?
    var BUDGET: Int?
    var GENRES: Array<DetailGenre>?
    var HOMEPAGE: String?
    var ID: Int?
    var IMDB_ID: String?
    var ORIGINAL_LANGUAGE: String?
    var ORIGINAL_TITLE: String?
    var OVERVIEW: String?
    var POPULARITY: Double?
    var POSTER_PATH: String?
    var PRODUCTION_COMPANIES: Array<AnyObject>?
    var PRODUCTION_COUNTRIES: Array<AnyObject>?
    var RELEASE_DATE: String?
    var REVENUE: Int?
    var RUNTIME: Int?
    var SPOKEN_LANGUAGES: Array<AnyObject>?
    var STATUS: String?
    var TAGLINE: String?
    var TITLE: String?
    var VIDEO: Bool?
    var VOTE_AVERAGE: Double?
    var VOTE_COUNT: Int?
    
    
    mutating func mapping(map: Map) {
        ADULT <- map["adult"]
        BACKDROP_PATH <- map["backdrop_path"]
        BELONGS_TO_COLLECTION <- map["belongs_to_collection"]
        BUDGET <- map["budget"]
        GENRES <- map["genres"]
        HOMEPAGE <- map["homepage"]
        ID <- map["id"]
        POSTER_PATH <- map["poster_path"]
        IMDB_ID <- map["imdb_id"]
        ORIGINAL_LANGUAGE <- map["original_language"]
        ORIGINAL_LANGUAGE <- map["original_language"]
        ORIGINAL_TITLE <- map["original_title"]
        OVERVIEW <- map["overview"]
        POPULARITY <- map["popularity"]
        POSTER_PATH <- map["poster_path"]
        PRODUCTION_COMPANIES <- map["production_companies"]
        PRODUCTION_COUNTRIES <- map["production_countries"]
        RELEASE_DATE <- map["release_date"]
        REVENUE <- map["revenue"]
        RUNTIME <- map["runtime"]
        SPOKEN_LANGUAGES <- map["spoken_languages"]
        STATUS <- map["status"]
        TAGLINE <- map["tagline"]
        TITLE <- map["title"]
        VIDEO <- map["video"]
        VOTE_AVERAGE <- map["vote_average"]
        VOTE_COUNT <- map["vote_count"]
    }
    
    init?(map: Map) {
        mapping(map: map)
    }
}
