
import UIKit
import Alamofire

class PeopleListService {
    
    static let instance = PeopleListService()
    let params = Parameters.getInstance()
    
    static func getInstance() -> PeopleListService {
        return instance
    }
    
    func loadData(callBack:@escaping([PeopleList]) -> Void) {
        let TOPLIST_URL = params.HOST + "person/popular?api_key=" + params.API_KEY + "&language=" +  params.LANG
        let request = Alamofire.request(TOPLIST_URL)
        
        request.responseArray(keyPath: "results") {(response: DataResponse<[PeopleList]>) in
            if let responseData = response.result.value {
                callBack(responseData);
            }
        }
    }
}
