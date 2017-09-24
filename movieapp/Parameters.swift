

import Foundation


final class Parameters {

    static let sharedInstance = Parameters()
    let HOST = "https://api.themoviedb.org/3/"
    let API_KEY = "381382bc1dab389e3ab4def463178a04"
    let LANG = "en-US"
    
    //To prevent others from using the default '()' initializer
    private init(){ }
    
    static func shared() -> Parameters {
        return sharedInstance
    }
}
