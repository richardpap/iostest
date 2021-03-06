//
//  MovieListViewController.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 09..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import ObjectMapper
import AlamofireObjectMapper


class MovieListViewController: UITableViewController {
    
    var IS_DATA_LOADED = false
    var moviesData = [MovieList]()

    private let moviesListPresenter = MovieListPresenter(service: MovieListService.shared())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBarItems()
        
        tableView.register(MovieListViewCell.self, forCellReuseIdentifier: "MovieCell")
        tableView.rowHeight = 180
        tableView.isHidden = true
        showLoading()
        
        moviesListPresenter.attachView(view: self)
        moviesListPresenter.getDatalist()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func setNavigationBarItems() {
        self.navigationItem.title = "Movies"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell: MovieListViewCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath ) as! MovieListViewCell
        
        if IS_DATA_LOADED {
            cell.bind(moviesData[index])
        }
        
        return cell
    }
    
    func setData(_ list: [MovieList]) {
        moviesData = list
        IS_DATA_LOADED = true
        tableView.reloadData()
        hideLoading()
        tableView.isHidden = false
    }
    
    
    // called when the cell is selected.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = MovieDetailsViewController()
        if let movieID = moviesData[indexPath.row].ID {
            VC.MOVIE_ID = movieID
        }
        navigationController?.pushViewController(VC, animated: true)
    }
    
    
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     //override func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}
