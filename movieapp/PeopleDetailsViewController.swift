//
//  PeopleViewController.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit

class PeopleDetailsViewController: UIViewController {
    
    private let detailsView = PeopleDetailsView(frame: CGRect.zero)
    private let tvDetailsPresenter = PeopleDetailsPresenter(service: PeopleDetailsService.getInstance())
    var PEOPLE_ID = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLoading()
        
        view.addSubview(detailsView)
        
        tvDetailsPresenter.attachView(view: self)
        tvDetailsPresenter.setId(PEOPLE_ID)
        tvDetailsPresenter.getData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setData(_ data: PeopleDetails) {
        hideLoading()
        displayData(data)
    }
    
    
    func displayData(_ data: PeopleDetails) {
        detailsView.bind(peopleData: data)
        hideLoading()
    }
}
