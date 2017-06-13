//
//  MovieListPresenter.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 19..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit

class MovieListPresenter {
    
    private let service: MovieListService
    weak private var listView: MovieListViewController?
    
    init(service: MovieListService){
        self.service = service
    }
    
    func attachView(view: MovieListViewController){
        self.listView = view
    }
    
    func detachView() {
        listView = nil
    }
    
    func getDatalist(){
        service.loadData(){ [weak self] data in
            self?.listView?.setData(data)
        }
    }
}

