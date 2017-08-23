//
//  TVListViewController.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit

class TVListViewController: UITableViewController {
    
    var IS_DATA_LOADED = false
    var tvData = [TVList]()
    
    private let tvListPresenter = TVListPresenter(service: TVListService.getInstance())
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBarItems()
        
        tableView.register(TVListViewCell.self, forCellReuseIdentifier: "TVCell")
        tableView.rowHeight = 180
        tableView.isHidden = true
        showLoading()
        
        tvListPresenter.attachView(view: self)
        tvListPresenter.getDatalist()
        
        GenresService.getInstance().loadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func setNavigationBarItems() {
        self.navigationItem.title = "TV Shows"
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
        
        let cell: TVListViewCell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath ) as! TVListViewCell
        
        if IS_DATA_LOADED {
            let index = indexPath.row
            cell.bind(tvData, index)
        }
        
        return cell
    }
    
    func setData(_ list: [TVList]) {
        tvData = list
        IS_DATA_LOADED = true
        tableView.reloadData()
        hideLoading()
        tableView.isHidden = false
    }
    
    
    // called when the cell is selected.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = TVDetailsViewController()
        if let tvID = tvData[indexPath.row].ID {
            VC.TV_ID = tvID
        }
        navigationController?.pushViewController(VC, animated: true)
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}
