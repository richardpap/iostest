//
//  PreloaderViewController.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 24..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit

class PreloaderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showLoading()
        
        ImageloaderService.getInstance().loadData(){[weak self] data in
            guard let strongSelf = self else { return }
            strongSelf.loadApp()
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadApp() {
        hideLoading()
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Main") as UIViewController
        self.present(nextViewController, animated:true, completion:nil)
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
