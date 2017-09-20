
import UIKit
import Alamofire
import RxCocoa
import RxSwift

class GenresService {
    
    static let instance = GenresService()
    let params = Parameters.getInstance()
    var GENRES_LIST = [GenresList]()
    
    static func getInstance() -> GenresService {
        return instance
    }
    
    let loadGenresData = Observable<[GenresList]>.create {(observer) -> Disposable in
        
        DispatchQueue.global(qos: .default).async {
            
            let params = Parameters.getInstance()
            let GENRES_URL = params.HOST + "genre/movie/list?api_key=" + params.API_KEY + "&language=" + params.LANG
            let request = Alamofire.request(GENRES_URL)
            
            request.responseArray(keyPath: "genres") {(response: DataResponse<[GenresList]>) in
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
    
    func setData(_ list: [GenresList]) {
        self.GENRES_LIST = list
    }
}
