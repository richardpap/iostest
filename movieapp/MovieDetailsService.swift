
import UIKit
import Alamofire

final class MovieDetailsService {
    
    static let sharedInstance = MovieDetailsService()
    let params = Parameters.shared()
    var MOVIE_ID = 0
    
    static func shared() -> MovieDetailsService {
        return sharedInstance
    }
    
    func setId(_ movieId: Int) {
        MOVIE_ID = movieId;
    }
    
    func loadData(callBack:@escaping(MovieDetails) -> Void) {
        let TOPLIST_URL = params.HOST + "movie/" + String(MOVIE_ID) + "?api_key=" + params.API_KEY + "&language=" + params.LANG
        let request = Alamofire.request(TOPLIST_URL)
        
        request.responseObject{(response: DataResponse<MovieDetails>) in
            if let responseData = response.result.value {
                callBack(responseData)
                
            }
        }
    }
}
