//
//  genres.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 12..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation
import ObjectMapper

class GenresList: Mappable {
    
     var ID: Int?
     var NAME: String?

    
    func mapping(map: Map) {
        ID <- map["id"]
        NAME <- map["name"]
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }
}
