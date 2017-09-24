
import Foundation
import Alamofire

final class TVDetailsService {

    static let sharedInstance = TVDetailsService()
    let params = Parameters.shared()
    var TV_ID = 0
    
    static func shared() -> TVDetailsService {
        return sharedInstance
    }
    
    func setId(_ tvId: Int) {
        TV_ID = tvId;
    }
    
    func loadData(callBack:@escaping(TVDetails) -> Void) {
        let TOPLIST_URL = params.HOST + "tv/" + String(TV_ID) + "?api_key=" + params.API_KEY + "&language=" + params.LANG
        let request = Alamofire.request(TOPLIST_URL)
        
        request.responseObject{(response: DataResponse<TVDetails>) in
            if let data = response.result.value {
                callBack(data)
                
            }
        }
    }
}
