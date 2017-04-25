//
//  MovieItem.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 10..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieItemMap: Mappable {
    
    public var genre_ids : Array<Int>?
    public var adult : String?
    public var id : Int?
    public var original_title : String?
    public var backdrop_path : String?
    public var vote_average : Int?
    public var popularity : Double?
    public var poster_path : String?
    public var overview : String?
    public var title : String?
    public var original_language : String?
    public var vote_count : Int?
    public var release_date : String?
    public var video : String?
    

    func mapping(map: Map) {
        genre_ids <- map["genre_ids"]
        adult <- map["adult"]
        id <- map["id"]
        original_title <- map["original_title"]
        backdrop_path <- map["backdrop_path"]
        vote_average <- map["vote_average"]
        popularity <- map["popularity"]
        poster_path <- map["poster_path"]
        overview <- map["overview"]
        title <- map["title"]
        original_language <- map["original_language"]
        vote_count <- map["vote_count"]
        release_date <- map["release_date"]
        video <- map["video"]
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }
}
