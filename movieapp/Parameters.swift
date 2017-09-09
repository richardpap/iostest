

import Foundation


struct Parameters {
    
    static let instance = Parameters()
    let HOST = "https://api.themoviedb.org/3/"
    let API_KEY = "381382bc1dab389e3ab4def463178a04"
    let LANG = "en-US"
    
    private init(){
        //To prevent others from using the default '()' initializer
    }
    
    static func getInstance() -> Parameters {
        return instance
    }
}
