
import UIKit
import Alamofire
import RxCocoa
import RxSwift

final class GenresService {
    
    static let sharedInstance = GenresService()
    let params = Parameters.shared()
    var GENRES_LIST = [GenresList]()
    
    private init() { }
    
    static func shared() -> GenresService {
        return sharedInstance
    }
    
    let loadGenresData = Observable<[GenresList]>.create {(observer) -> Disposable in
        
        DispatchQueue.global(qos: .default).async {
            
            let params = Parameters.shared()
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
    
    func getGenresText(_ genreIds: [Int]) -> String {
        var genresListText = ""
        var filteredArray = [GenresList]()
        
        for item in genreIds {
            filteredArray += GENRES_LIST.filter({$0.ID == item})
        }
        
        for item in filteredArray {
            if let genreName = item.NAME {
                if (genresListText.characters.count != 0) {
                    genresListText += ", "
                }
                
                genresListText += genreName
            }
        }
        
        return genresListText
    }
}
