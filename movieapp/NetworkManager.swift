//
//  NetworkManager.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 08..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import Kingfisher


class NetworkManager {
    
    static let instance = NetworkManager()
    
    var MOVIE_ID: Int = 0
    
    static func getInstance() -> NetworkManager {
        return self.instance
    }
    
    func setMovieId(_ movieId: Int) {
        self.MOVIE_ID = movieId
    }
    
    func getMovieId() -> Int {
        return self.MOVIE_ID
    }
}



