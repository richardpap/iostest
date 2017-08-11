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
        resultsController.tableView.register(SearchListViewCell.self, forCellReuseIdentifier: "SearchResultsCell")
        resultsController.tableView.rowHeight = 180
        tableView.register(SearchListViewCell.self, forCellReuseIdentifier: "SearchCell")
        tableView.rowHeight = 180
        //tableView.isHidden = true
        
        searchController.searchBar.delegate = self
        setPresenter()
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
        
        let index = indexPath.row
        print("Filling up cell at index \(index)")
        
        if searchController.isActive {
            let cell: SearchListViewCell = resultsController.tableView.dequeueReusableCell(withIdentifier: "SearchResultsCell", for: indexPath ) as! SearchListViewCell
            cell.bind(searchData, index)
            return cell
        } else {
            let cell: SearchListViewCell = self.tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath ) as! SearchListViewCell
            cell.bind(searchData, index)
            return cell
        }
    }

    
    
    func setData(_ list: [SearchListData]) {
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
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Text changed")
        //tableView.contentOffset = CGPoint.zero
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Search clicked")
        searchData.removeAll()
        
        //update results tableview here
        let keywords = self.searchController.searchBar.text
        
        if let keywords = keywords {
            if keywords.characters.count > 0 {
                print("Requesting response from DB :: 01")
                searchPresenter.getDatalist(keywords)
            }
        }
        
        //dismiss(animated: true, completion: nil)
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
    
    
    func updateSearchResults(for searchController: UISearchController) {
        print("Update search results stuff")
    }

}
