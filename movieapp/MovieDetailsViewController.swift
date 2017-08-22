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
        addBackButton()
        
        view.addSubview(detailsView)
        
        movieDetailsPresenter.attachView(view: self)
        movieDetailsPresenter.setId(MOVIE_ID)
        movieDetailsPresenter.getData()
        
        print("Selected ID::: \(self.MOVIE_ID)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addBackButton() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 60))
        let navItem = UINavigationItem(title: "")
        let backItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: #selector(backAction))
        navItem.leftBarButtonItem = backItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    func backAction(_ sender: UIButton) {
        let VC = TabBarController()
        VC.modalTransitionStyle = .flipHorizontal
        self.present(VC, animated: true, completion: nil)
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


