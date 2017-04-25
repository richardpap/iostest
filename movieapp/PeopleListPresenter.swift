//
//  PeopleListPresenter.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation

class PeopleListPresenter {
    
    private let service: PeopleListService
    weak private var listView: PeopleListViewController?
    
    init(service: PeopleListService){
        self.service = service
    }
    
    func attachView(view: PeopleListViewController){
        self.listView = view
    }
    
    func detachView() {
        listView = nil
    }
    
    func getData(){
        service.loadData(){ [weak self] data in
            self?.listView?.setData(list: data)
        }
    }
}
