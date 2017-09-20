
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
    
    func setData(_ list: MovieImages) {
        if
            let host = list.SECURE_BASE_URL,
            let imgSizeList = list.BACKDROP_SIZES {
                self.IMAGE_SIZE_LIST = imgSizeList
                self.IMG_HOST = host
  
        }
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
