//
//  SearchViewController.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 08. 01..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, UISearchResultsUpdating {
    
    private let searchPresenter = SearchPresenter(service: SearchService.getInstance())
    private var IS_DATA_LOADED = false
    private var searchData = [SearchListData]()
    private var searchController = UISearchController(searchResultsController: nil)
    private var dataListController = UITableViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarItems()
        setSearchController()
        tableView.register(SearchListViewCell.self, forCellReuseIdentifier: "SearchCell")
        tableView.rowHeight = 180
        //tableView.isHidden = true
        setPresenter()
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        //update results tableview here
        let keywords = self.searchController.searchBar.text
        
        if let keywords = keywords {
            if keywords.characters.count > 3 {
                searchPresenter.getDatalist(keywords)
            }
        }
    }
    
    
    func setSearchController() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
    }
    
    
    func setPresenter() {
        searchPresenter.attachView(view: self)
        searchPresenter.getDatalist("alien")
    }
    
    
    func setNavigationBarItems() {
        self.navigationItem.title = "Search"
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchListViewCell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath ) as! SearchListViewCell
        let index = indexPath.row
        
        cell.bind(searchData, index)
        
        return cell
    }
    
    
    func setData(_ list: [SearchListData]) {
        //tableView.dataSource = nil
        //tableView.delegate = nil
        
        searchData = list
        IS_DATA_LOADED = true
        tableView.reloadData()
        hideLoading()
        
        print("Reloading the view \(IS_DATA_LOADED)")
        //tableView.isHidden = false
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
