//
//  SearchTestController.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 08. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SearchTestController: UIViewController {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //let githubService: GitHubService
    //var disposeBag = DisposeBag()
    
    let tableView = UITableView()
    let searchBar = UISearchBar()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.navigationController?.navigationBar.barStyle = .blackOpaque
        self.navigationItem.titleView = self.searchBar
        self.searchBar.placeholder = "Search"
        
        self.tableView.keyboardDismissMode = .onDrag
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
        
        self.bind()
    }
    
    func bind() {

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.frame = self.view.bounds
    }

}
