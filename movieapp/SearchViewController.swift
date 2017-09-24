//
//  SearchViewController.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 08. 01..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit
import Alamofire
import RxCocoa
import RxSwift

class SearchViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    private var cellId = "SearchCell"
    private var IS_DATA_LOADED = false
    //binding the presenter
    let searchPresenter = SearchPresenter(service: SearchService.shared())
    //pass nil if you wish to display search results in the same view that you are searching.
    private var searchController = UISearchController(searchResultsController: nil)
    //private var resultsController = UITableViewController()
    private var searchData = [SearchListData]() {
        didSet {
            print("The value of searchData changed from \(oldValue) to \(searchData)")
        }
    }
    
    private let disposeBag = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBarItems()
        setSearchController()
        setPresenter()

        tableView.register(SearchListViewCell.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = 180
        tableView.backgroundColor = .white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchController.dismiss(animated: false, completion: nil)
    }
    
    
    
    
    /* ===================================================
     // @ Setup
     =================================================== */
    
    func setSearchController() {
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        searchController.searchBar.keyboardType = .emailAddress
    }
    
    
    func setPresenter() {
        searchPresenter.attachView(view: self)
        //searchPresenter.getTopList()
        SearchService.shared().getTopListData.subscribe(onNext:{ (responseData) in
            self.searchData = responseData
            print("RXLife::::::::::::::::::::::")
            self.IS_DATA_LOADED = true
            
            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
                self.hideLoading()
            })
        }).addDisposableTo(disposeBag)
        
        
        //let getToplListEl = SearchService.getInstance().getTopListData;
        //Observable.just(1).subscribe(getToplListEl)
    }
    
    
    func setNavigationBarItems() {
        navigationItem.title = "Search"
    }
    
    

    
    /* ===================================================
     // @ TableView
     =================================================== */
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
        let cell: SearchListViewCell = self.tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchListViewCell
        
        if searchData.count > 0 {
            cell.bind(searchData[index])
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let favRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "      ", handler:{action, indexpath in
            print("MORE•ACTION");
            self.addToFavourites(indexPath.row);
        });
        
        favRowAction.backgroundColor = UIColor(red: 0.298, green: 0.851, blue: 0.3922, alpha: 1.0);
        favRowAction.backgroundColor = UIColor(patternImage: UIImage(named: "Star")!)
        
        let delRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete", handler:{action, indexpath in
            self.searchData.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        });
        
        return [delRowAction, favRowAction];
    }
    

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            searchData.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
        
        if editingStyle == .insert {
            print("add")
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = MovieDetailsViewController()
        if let movieID = searchData[indexPath.row].ID {
            VC.MOVIE_ID = movieID
        }
        navigationController?.pushViewController(VC, animated: true)
    }
    
    
    
    
    func addToFavourites(_ indexPath: Int) {
        
    }
    
    

    /* ===================================================
    // @ Search and data
    =================================================== */
    func updateSearchResults(for searchController: UISearchController) {
        let keywords = self.searchController.searchBar.text
        
        if let keywords = keywords {
            if keywords.characters.count > 0 {
                self.IS_DATA_LOADED = false
                self.showLoading()
                self.searchData = []
                self.tableView.reloadData()
                print("Requesting response from DB :: 01, keyword: \(keywords)")
                searchPresenter.getSearchList(keywords)
            }
        }
    }
    
    
    func setSearchList(_ list: [SearchListData]) {
        self.searchData = list
        self.IS_DATA_LOADED = true
        print("Data recived :: 02")
        
        
        DispatchQueue.main.async(execute: {
            print("Reloading tableview :: 03")
            self.tableView.reloadData()
            self.hideLoading()
        })
    }
    
    
    func setTopList(_ list: [SearchListData]) {
        searchData = list
        IS_DATA_LOADED = true
        
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
            self.hideLoading()
        })
    }
    
    
    
    /* ===================================================
     // @ Searchbar events
     =================================================== */
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.characters.count == 0 {
            print("Wipe")
            //searchPresenter.getTopList()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Search clicked")
        dismiss(animated: true, completion: nil)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Game Over")
        //searchPresenter.getTopList()
    }

}
