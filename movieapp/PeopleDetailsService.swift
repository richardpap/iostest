//
//  PeopleDetailsService.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation
import Alamofire

class PeopleDetailsService {
    
    static let instance = PeopleDetailsService()
    let params = Parameters.getInstance()
    var PEOPLE_ID = 0
    
    static func getInstance() -> PeopleDetailsService {
        return instance
    }
    
    func setId(_ peopleId: Int) {
        PEOPLE_ID = peopleId;
    }
    
    func loadData(callBack:@escaping(PeopleDetails) -> Void) {
        let TOPLIST_URL = params.HOST + "person/" + String(PEOPLE_ID) + "?api_key=" + params.API_KEY + "&language=" + params.LANG
        let request = Alamofire.request(TOPLIST_URL)
        
        request.responseObject{(response: DataResponse<PeopleDetails>) in
            if let data = response.result.value {
                callBack(data)
                
            }
        }
    }
}
