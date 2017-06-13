//
//  PeopleDetailsPresenter.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation

class PeopleDetailsPresenter {
    
    private let service: PeopleDetailsService
    weak private var listView: PeopleDetailsViewController?
    
    init(service: PeopleDetailsService){
        self.service = service
    }
    
    func attachView(view: PeopleDetailsViewController){
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
