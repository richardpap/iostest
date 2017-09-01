//
//  TabBarControllerViewController.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 08. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //let layout = UITableViewController()
        let moviesListController = MovieListViewController()
        let moviesTabController = UINavigationController(rootViewController: moviesListController)
        moviesTabController.tabBarItem.title = "Movies"
        moviesTabController.tabBarItem.image = UIImage(named: "movie")
        moviesTabController.tabBarItem.selectedImage = UIImage(named: "movie")
        //moviesTabController.tabBarItem.accessibilityFrame.height. = 30
        
        let tvListController = TVListViewController()
        let tvTabController = UINavigationController(rootViewController: tvListController)
        tvTabController.tabBarItem.title = "TV Shows"
        tvTabController.tabBarItem.image = UIImage(named: "tv")
        tvTabController.tabBarItem.selectedImage = UIImage(named: "tv")
        
        let peopleListController = PeopleListViewController()
        let peopleTabController = UINavigationController(rootViewController: peopleListController)
        peopleTabController.tabBarItem.title = "People"
        peopleTabController.tabBarItem.image = UIImage(named: "people")
        peopleTabController.tabBarItem.selectedImage = UIImage(named: "people")
        
        let searchListController = SearchViewController()
        let searchTabController = UINavigationController(rootViewController: searchListController)
        searchTabController.tabBarItem.title = "Search"
        searchTabController.tabBarItem.image = UIImage(named: "search")
        searchTabController.tabBarItem.selectedImage = UIImage(named: "search")
        
        viewControllers = [moviesTabController, tvTabController, peopleTabController, searchTabController]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
