
import UIKit
import Alamofire
import RxCocoa
import RxSwift

class ImageloaderService {
    
    static let instance = ImageloaderService()
    var IMG_HOST = ""
    var IMAGE_SIZE_LIST = [String]()
    var params = Parameters.getInstance()
    
    static func getInstance() -> ImageloaderService {
        return instance
    }
    
    let loadImageData = Observable<MovieImages>.create {(observer) -> Disposable in
        
        DispatchQueue.global(qos: .default).async {
            
            let params = Parameters.getInstance()
            let URL =  params.HOST  + "configuration?api_key=" + params.API_KEY
            let request = Alamofire.request(URL)
            
            request.responseObject(keyPath: "images") {(response: DataResponse<MovieImages>) in
                if let responseData = response.result.value {
                    observer.onNext(responseData)
                } else {
                    observer.onError("Error" as! Error)
                }
                observer.onCompleted()
            }
        }
        
        return Disposables.create()
    }
    
    func setData(_ data: MovieImages) {
        if let host = data.SECURE_BASE_URL {
            self.IMG_HOST = host
        } else {
            self.IMG_HOST = "https://image.tmdb.org/t/p/"
        }
        
        if let imgSizeList = data.BACKDROP_SIZES {
            self.IMAGE_SIZE_LIST = imgSizeList
        } else {
            self.IMAGE_SIZE_LIST = ["w300", "w780", "w1280", "original"]
        }
    }
}
