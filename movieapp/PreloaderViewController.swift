//
//  PreloaderViewController.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 24..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class PreloaderViewController: UIViewController {
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        showLoading()
        
        let genresData = GenresService.getInstance().loadGenresData
        let imgData = ImageloaderService.getInstance().loadImageData
        
        let oHandler = Observable.zip(genresData, imgData, resultSelector: { (GenresList, MovieImages) in
            return (GenresList, MovieImages)
        })
        
        oHandler.subscribe(onNext:{ (GenresList, MovieImages) in
            print("Preloader ftw")
            GenresService.getInstance().setData(GenresList)
            ImageloaderService.getInstance().setData(MovieImages)
            self.loadApp()
        }).addDisposableTo(disposeBag)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadApp() {
        hideLoading()
        //let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        //let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Main") as UIViewController
        self.present(TabBarController(), animated:true, completion:nil)
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
