//
//  MovieDetailsPresenter.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 19..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit

class MovieDetailsPresenter {
    
    private let service: MovieDetailsService
    weak private var listView: MovieDetailsViewController?
    
    init(service: MovieDetailsService){
        self.service = service
    }
    
    func attachView(view: MovieDetailsViewController){
        self.listView = view
    }
    
    func detachView() {
        listView = nil
    }
    
    func getData(){
        service.loadData(){ [weak self] movieData in
            self?.listView?.setData(movieData)
        }
    }
    
    func setId(_ id: Int) {
        service.setId(id)
    }
}


