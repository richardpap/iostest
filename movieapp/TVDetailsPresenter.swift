//
//  TVDetailsPresenter.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation

class TVDetailsPresenter {
    
    private let service: TVDetailsService
    weak private var listView: TVDetailsViewController?
    
    init(service: TVDetailsService){
        self.service = service
    }
    
    func attachView(view: TVDetailsViewController){
        self.listView = view
    }
    
    func detachView() {
        listView = nil
    }
    
    func getData(){
        service.loadData(){ [weak self] movieData in
            self?.listView?.setData(data: movieData)
        }
    }
    
    func setId(id: Int) {
        service.setId(tvId: id)
    }
}
