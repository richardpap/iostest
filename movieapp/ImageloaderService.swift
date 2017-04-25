//
//  ImagesService.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 19..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit
import Alamofire

class ImageloaderService {
    
    static let instance = ImageloaderService()
    var IMG_HOST = ""
    var IMAGE_SIZE_LIST = [String]()
    var params = Parameters()
    
    static func getInstance() -> ImageloaderService {
        return instance
    }
    
    func loadData(callBack:@escaping() -> Void) {
        
        let URL =  params.HOST  + "configuration?api_key=" + params.API_KEY
        let request = Alamofire.request(URL)
        
        request.responseObject(keyPath: "images") {[weak self] (response: DataResponse<MovieImages>) in
            guard let strongSelf = self else { return }
            
            if let responseData = response.result.value {
                if
                    let host = responseData.SECURE_BASE_URL,
                    let imgSizeList = responseData.BACKDROP_SIZES {
                    strongSelf.IMAGE_SIZE_LIST = imgSizeList
                    strongSelf.IMG_HOST = host
                    
                    print("Config loaded \(responseData)")
                    callBack()
                }
            } else {
                strongSelf.IMG_HOST = "https://image.tmdb.org/t/p/"
                strongSelf.IMAGE_SIZE_LIST = ["w300", "w780", "w1280", "original"]
            }
        }
    }
}
