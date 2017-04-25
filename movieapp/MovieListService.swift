//
//  MovieListService.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 19..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit
import Alamofire

class MovieListService {
    
    static let instance = MovieListService()
    let params = Parameters.getInstance()
        
    static func getInstance() -> MovieListService {
        return instance
    }
    
    func loadData(callBack:@escaping([MovieList]) -> Void) {
        let TOPLIST_URL = params.HOST + "movie/popular?api_key=" + params.API_KEY + "&language=" +  params.LANG
        let request = Alamofire.request(TOPLIST_URL)
        
        request.responseArray(keyPath: "results") {(response: DataResponse<[MovieList]>) in
            if let responseData = response.result.value {
                callBack(responseData);
            }
        }
    }
}
