
import UIKit
import Alamofire

final class MovieListService {

    static let sharedInstance = MovieListService()
    let params = Parameters.shared()
        
    static func shared() -> MovieListService {
        return sharedInstance
    }
    
    func loadData(callBack:@escaping([MovieList]) -> Void) {
        let TOPLIST_URL = params.HOST + "movie/popular?api_key=" + params.API_KEY + "&language=" +  params.LANG
        let request = Alamofire.request(TOPLIST_URL)
        
        request.responseArray(keyPath: "results") {(response: DataResponse<[MovieList]>) in
            if let responseData = response.result.value {
                callBack(responseData);
            }
        }
    }
}
