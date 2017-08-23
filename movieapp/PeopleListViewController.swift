//
//  PeopleListViewController.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit

class PeopleListViewController: UITableViewController {
    
    var IS_DATA_LOADED = false
    var peopleData = [PeopleList]()
    
    private let peopleListPresenter = PeopleListPresenter(service: PeopleListService.getInstance())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBarItems()
        
        tableView.register(PeopleListViewCell.self, forCellReuseIdentifier: "PeopleCell")
        tableView.rowHeight = 180
        tableView.isHidden = true
        showLoading()
        
        peopleListPresenter.attachView(view: self)
        peopleListPresenter.getData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    func setNavigationBarItems() {
        self.navigationItem.title = "People"
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
        
        let cell: PeopleListViewCell = tableView.dequeueReusableCell(withIdentifier: "PeopleCell", for: indexPath ) as! PeopleListViewCell
        
        if IS_DATA_LOADED {
            let index = indexPath.row
            cell.bind(peopleData, index)
        }
        
        return cell
    }
    
    func setData(_ list: [PeopleList]) {
        peopleData = list
        IS_DATA_LOADED = true
        tableView.reloadData()
        hideLoading()
        tableView.isHidden = false
    }
    

    // called when the cell is selected.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = PeopleDetailsViewController()
        if let peopleID = peopleData[indexPath.row].ID {
            VC.PEOPLE_ID = peopleID
        }
        navigationController?.pushViewController(VC, animated: true)
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}
