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
    private var searchData = [SearchListData]()
    private var searchController = UISearchController()
    private var resultsController = UITableViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarItems()
        setSearchController()
        resultsController.tableView.register(SearchListViewCell.self, forCellReuseIdentifier: "SearchCell")
        resultsController.tableView.rowHeight = 180
        //tableView.isHidden = true
        setPresenter()
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        //update results tableview here
        let keywords = self.searchController.searchBar.text
        
        if let keywords = keywords {
            if keywords.characters.count > 0 {
                print("Requesting response from DB :: 01")
                searchPresenter.getDatalist(keywords)
            }
        }
        
        resultsController.tableView.reloadData()
    }
    

    
    func setSearchController() {
        resultsController.tableView.dataSource = self
        resultsController.tableView.delegate = self
        
        searchController = UISearchController(searchResultsController: resultsController)
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
        navigationItem.title = "Search"
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Search data length is \(searchData.count)")
        
        if searchController.isActive {
            return searchData.count
        }
        
        return searchData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchListViewCell = resultsController.tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath ) as! SearchListViewCell
        let index = indexPath.row
        
        print("Filling up cell at index \(index)")
        
        cell.bind(searchData, index)
        
        return cell
    }

    
    
    func setData(_ list: [SearchListData]) {
        searchData.removeAll()
        resultsController.tableView.reloadData()
        
        searchData = list
        print("Data recived :: 02")
        resultsController.tableView.reloadData()
        print("Reloading tableview :: 03")
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
