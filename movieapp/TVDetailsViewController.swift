//
//  TVDetailsViewController.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit

class TVDetailsViewController: UIViewController {
    
    private let detailsView = TVDetailsView(frame: CGRect.zero)
    private let tvDetailsPresenter = TVDetailsPresenter(service: TVDetailsService.getInstance())
    var TV_ID = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLoading()
        
        view.addSubview(detailsView)
        
        tvDetailsPresenter.attachView(view: self)
        tvDetailsPresenter.setId(TV_ID)
        tvDetailsPresenter.getData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setData(_ data: TVDetails) {
        hideLoading()
        displayData(data)
    }
    
    
    func displayData(_ data: TVDetails) {
        detailsView.bind(data)
        hideLoading()
    }
}
