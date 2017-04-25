//
//  TVListService.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit
import Alamofire

class TVListService {
    
    static let instance = TVListService()
    let params = Parameters.getInstance()
    
    static func getInstance() -> TVListService {
        return instance
    }
    
    func loadData(callBack:@escaping([TVList]) -> Void) {
        let TOPLIST_URL = params.HOST + "tv/popular?api_key=" + params.API_KEY + "&language=" +  params.LANG
        let request = Alamofire.request(TOPLIST_URL)
        
        request.responseArray(keyPath: "results") {(response: DataResponse<[TVList]>) in            
            if let responseData = response.result.value {
                callBack(responseData);
            }
        }
    }
}
