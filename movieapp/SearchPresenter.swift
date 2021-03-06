//
//  SearchPresenter.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 08. 01..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit

class SearchPresenter {
    
    private let service: SearchService
    weak private var listView: SearchViewController?
    
    init(service: SearchService){
        self.service = service
    }
    
    func attachView(view: SearchViewController){
        self.listView = view
    }
    
    func detachView() {
        listView = nil
    }
    
    func getSearchList(_ keywords: String) {
        service.setKeywords(keywords)
        
        service.getSearchData(){ [weak self] data in
            self?.listView?.setSearchList(data)
        }
    }
    
    func getTopList() {
        /*
        service.getTopListData(){ [weak self] data in
            self?.listView?.setTopList(data)
        }*/
    }
}

