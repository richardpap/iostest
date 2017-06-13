//
//  TVDetailsService.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation
import Alamofire

class TVDetailsService {
    
    static let instance = TVDetailsService()
    let params = Parameters.getInstance()
    var TV_ID = 0
    
    static func getInstance() -> TVDetailsService {
        return instance
    }
    
    func setId(_ tvId: Int) {
        TV_ID = tvId;
    }
    
    func loadData(callBack:@escaping(TVDetails) -> Void) {
        let TOPLIST_URL = params.HOST + "tv/" + String(TV_ID) + "?api_key=" + params.API_KEY + "&language=" + params.LANG
        let request = Alamofire.request(TOPLIST_URL)
        
        request.responseObject{(response: DataResponse<TVDetails>) in
            if let data = response.result.value {
                callBack(data)
                
            }
        }
    }
}
