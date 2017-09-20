
import UIKit
import Alamofire
import RxCocoa
import RxSwift

class SearchService {
    
    static let instance = SearchService()
    let params = Parameters.getInstance()
    private var SEARCH_URL: String = ""
    
    
    static func getInstance() -> SearchService {
        return instance
    }
    
    func setKeywords(_ keywords: String) {
        SEARCH_URL = params.HOST + "search/movie?api_key=" + params.API_KEY + "&language=" +  params.LANG + "&query=" + keywords + "&page=1&include_adult=false"
    }

    func getSearchData(callBack:@escaping([SearchListData]) -> Void) {
        let request = Alamofire.request(SEARCH_URL)
        
        request.responseArray(keyPath: "results") {(response: DataResponse<[SearchListData]>) in
            if let responseData = response.result.value {
                callBack(responseData);
            }
        }
    }
    
    let getTopListData = Observable<[SearchListData]>.create { (observer) -> Disposable in
        let keywords = "aliens"
        let params = Parameters.getInstance()
        
        DispatchQueue.global(qos: .default).async {
            let TOPLIST_URL = params.HOST + "movie/popular?api_key=" + params.API_KEY + "&language=" +  params.LANG
            let request = Alamofire.request(TOPLIST_URL)
            
            request.responseArray(keyPath: "results") {(response: DataResponse<[SearchListData]>) in
                if let responseData = response.result.value {
                    observer.onNext(responseData)
                    observer.onCompleted()
                }
            }
        }
        
        return Disposables.create()
    }
    /*
    func getTopListData(callBack:@escaping([SearchListData]) -> Void) {
        let TOPLIST_URL = params.HOST + "movie/popular?api_key=" + params.API_KEY + "&language=" +  params.LANG
        let request = Alamofire.request(TOPLIST_URL)
        
        request.responseArray(keyPath: "results") {(response: DataResponse<[SearchListData]>) in
            if let responseData = response.result.value {
                callBack(responseData);
            }
        }
    }*/
}
