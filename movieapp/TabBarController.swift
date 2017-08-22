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
        
        viewControllers = [moviesTabController]
        
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
