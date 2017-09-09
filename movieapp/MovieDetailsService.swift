
import UIKit
import Alamofire

class MovieDetailsService {
    
    static let instance = MovieDetailsService()
    let params = Parameters.getInstance()
    var MOVIE_ID = 0
    
    static func getInstance() -> MovieDetailsService {
        return instance
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
