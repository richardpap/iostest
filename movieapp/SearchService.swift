//
//  SearchService.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 08. 01..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit
import Alamofire

class SearchService {
    
    static let instance = SearchService()
    let params = Parameters.getInstance()
    private var SEARCH_URL: String = ""
    
    
    static func getInstance() -> SearchService {
        return instance
    }
    
    func setKeywords(_ keywords: String) {
        SEARCH_URL = params.HOST + "search/multi?api_key=" + params.API_KEY + "&language=" +  params.LANG + "&query=" + keywords + "&page=1&include_adult=false"
    }

    func loadData(callBack:@escaping([SearchListData]) -> Void) {
        
        let request = Alamofire.request(SEARCH_URL)
        
        request.responseArray(keyPath: "results") {(response: DataResponse<[SearchListData]>) in
            if let responseData = response.result.value {
                callBack(responseData);
            }
        }
    }
}
