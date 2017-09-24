
import UIKit
import Alamofire

final class TVListService {
    
    static let sharedInstance = TVListService()
    let params = Parameters.shared()
    
    static func shared() -> TVListService {
        return sharedInstance
    }
    
    func loadData(callBack:@escaping([TVList]) -> Void) {
        let TOPLIST_URL = params.HOST + "tv/popular?api_key=" + params.API_KEY + "&language=" +  params.LANG
        let request = Alamofire.request(TOPLIST_URL)
        
        request.responseArray(keyPath: "results") {(response: DataResponse<[TVList]>) in            
            if let responseData = response.result.value {
                callBack(responseData);
            }
        }
    }
}
