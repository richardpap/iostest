//
//  GenresService.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 19..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit
import Alamofire

class GenresService {
    
    static let instance = GenresService()
    let params = Parameters.getInstance()
    var GENRES_LIST = [GenresList]()
    
    static func getInstance() -> GenresService {
        return instance
    }
    
    func loadData() {
        let GENRES_URL = params.HOST + "genre/movie/list?api_key=" + params.API_KEY + "&language=" + params.LANG
        let request = Alamofire.request(GENRES_URL)
        
        request.responseArray(keyPath: "genres") {[weak self] (response: DataResponse<[GenresList]>) in
            guard let strongSelf = self else { return }
            
            if let responseData = response.result.value {
                strongSelf.GENRES_LIST = responseData
            }
        }
    }
}
