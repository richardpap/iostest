//
//  MovieDetailViewController.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 11..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import Kingfisher
import PureLayout


class MovieDetailsViewController: UIViewController {
    
    private let detailsView = DetailsView(frame: CGRect.zero)
    private let movieDetailsPresenter = MovieDetailsPresenter(service: MovieDetailsService.getInstance())
    var MOVIE_ID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLoading()
        
        view.addSubview(detailsView)
        
        movieDetailsPresenter.attachView(view: self)
        movieDetailsPresenter.setId(MOVIE_ID)
        movieDetailsPresenter.getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func setData(_ data: MovieDetails) {
        hideLoading()
        displayData(data)
    }
    
    
    func displayData(_ data: MovieDetails) {
        detailsView.bind(data)
        hideLoading()
    }

}


