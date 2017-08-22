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
        addBackButton()
        
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
    
    func setData(_ data: TVDetails) {
        hideLoading()
        displayData(data)
    }
    
    
    func displayData(_ data: TVDetails) {
        detailsView.bind(data)
        hideLoading()
    }
}
