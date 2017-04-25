//
//  TVListPresenter.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation

class TVListPresenter {
    
    private let service: TVListService
    weak private var listView: TVListViewController?
    
    init(service: TVListService){
        self.service = service
    }
    
    func attachView(view: TVListViewController){
        self.listView = view
    }
    
    func detachView() {
        listView = nil
    }
    
    func getDatalist(){
        service.loadData(){ [weak self] data in
            self?.listView?.setData(list: data)
        }
    }
}
