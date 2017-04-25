//
//  Config.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 11..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation
import ObjectMapper



class movieConfig: Mappable {
    
    public var images : Array<movieImages>
    
    
    func mapping(map: Map) {
        images <- map
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }
}
