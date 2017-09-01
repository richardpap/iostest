//
//  SearchViewController.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 08. 01..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    private var cellId = "SearchCell"
    private var IS_DATA_LOADED = false
    private let searchPresenter = SearchPresenter(service: SearchService.getInstance())
    private var searchController = UISearchController(searchResultsController: nil)
    //private var resultsController = UITableViewController()
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
        tableView.register(SearchListViewCell.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = 180
        //resultsController.tableView.rowHeight = 180
        
        //tableView.backgroundColor = .red
        //resultsController.tableView.backgroundColor = .blue
        //tableView.isHidden = true
        setPresenter()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func setSearchController() {
        //searchController.searchBar.delegate = self
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
        print("Search data length is \(searchData.count)")
        
        if searchController.isActive {
            return searchData.count
        }
        
        return searchData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        print("Filling up cell at index \(index)")
        
        let cell: SearchListViewCell = self.tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchListViewCell
        if searchData.count > 0 {
            cell.bind(searchData[index])
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            searchData.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
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
        print("Sending search data")
        tableView.reloadData()
    }

    
    
    func setData(_ list: [SearchListData]) {
        searchData = list
        print("Data recived :: 02")
        tableView.reloadData()
        print("Reloading tableview :: 03")
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
        tableView.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Game Over")
        //tableView.dataSource = resultsController.tableView.dataSource
        tableView.reloadData()
    }

}
