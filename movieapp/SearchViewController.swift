//
//  SearchViewController.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 08. 01..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    
    private var IS_DATA_LOADED = false
    private let searchPresenter = SearchPresenter(service: SearchService.getInstance())
    private var searchController = UISearchController()
    private var resultsController = UITableViewController()
    private var searchData = [SearchListData]() {
        didSet {
            print("The value of searchData changed from \(oldValue) to \(searchData)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarItems()
        setSearchController()
        //resultsController.tableView.register(SearchListViewCell.self, forCellReuseIdentifier: "SearchResultsCell")
        resultsController.tableView.rowHeight = 180
        tableView.register(SearchListViewCell.self, forCellReuseIdentifier: "SearchCell")
        tableView.rowHeight = 180
        //tableView.isHidden = true
        
        searchController.searchBar.delegate = self
        setPresenter()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func setSearchController() {
        resultsController.tableView.dataSource = self
        resultsController.tableView.delegate = self
        
        searchController = UISearchController(searchResultsController: resultsController)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        
        searchController.searchBar.keyboardType = .emailAddress
    }
    
    
    func setPresenter() {
        searchPresenter.attachView(view: self)
        //searchPresenter.getDatalist("alien")
    }
    
    
    func setNavigationBarItems() {
        navigationItem.title = "Search"
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Search data length is \(searchData.count)  --- \(tableView == self.resultsController.tableView)")
        
        if tableView == self.resultsController.tableView {
            return searchData.count
        }
        
        return searchData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        print("Filling up cell at index \(index)  --- \(tableView == self.resultsController.tableView)")
        
        let cell: SearchListViewCell = self.tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchListViewCell
        if searchData.count > 0 {
            cell.bind(searchData[index])
        }
        return cell
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        //update results tableview here
        let keywords = self.searchController.searchBar.text
        
        if let keywords = keywords {
            if keywords.characters.count > 0 {
                print("Requesting response from DB :: 01")
                searchPresenter.getDatalist(keywords)
                //self.searchController.setActive(false, animated: true)
            }
        }
        print("Sending search data  --- \(tableView == self.resultsController.tableView)")
        tableView.reloadData()
    }

    
    
    func setData(_ list: [SearchListData]) {
        searchData = list
        print("Data recived :: 02 --- \(tableView == self.resultsController.tableView)")
        resultsController.tableView.reloadData()
        print("Reloading tableview :: 03 --- \(tableView == self.resultsController.tableView)")
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Search clicked")
        //searchData.removeAll()
        dismiss(animated: true, completion: nil)
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Focuuus")
        resultsController.tableView.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Game Over")
        tableView.dataSource = resultsController.tableView.dataSource
        tableView.reloadData()
    }

}
