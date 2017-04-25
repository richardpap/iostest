//
//  Parameters.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation


struct Parameters {
    
    static let instance = Parameters()
    let HOST = "https://api.themoviedb.org/3/"
    let API_KEY = "381382bc1dab389e3ab4def463178a04"
    let LANG = "en-US"
    
    static func getInstance() -> Parameters {
        return instance
    }
}
