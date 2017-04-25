//
//  FirstViewController.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 07..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit
import Alamofire

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getTopMovies()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var HOST = "https://api.themoviedb.org/3/";
    var API_KEY = "381382bc1dab389e3ab4def463178a04";
    var LANG = "en-US";
    
    
    func getTopMovies() {
        let TOP_MOVIES_URL = HOST + "movie/popular?api_key=" + API_KEY + "&language=" + LANG;
        
        Alamofire.request(TOP_MOVIES_URL).responseJSON { response in
            //print(response.request)  // original URL request
            //print("==============")
            //print(response.response) // HTTP URL response
            //print("==============")
            //print(response.data)     // server data
            //print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        };
    }
    
    


}

