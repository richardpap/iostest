
import UIKit
import Alamofire
import ObjectMapper
import Kingfisher
import SnapKit


class MovieDetailsViewController: UIViewController {
    
    lazy var detailsView = DetailsView()
    let movieDetailsPresenter = MovieDetailsPresenter(service: MovieDetailsService.shared())
    var MOVIE_ID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoading()
        
        movieDetailsPresenter.attachView(view: self)
        movieDetailsPresenter.setId(MOVIE_ID)
        movieDetailsPresenter.getData()
        
        view.addSubview(detailsView)
        
        detailsView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.top.equalTo(view).offset(60)
            make.bottom.equalTo(view)
        }
        
        detailsView.setView(self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func setData(_ data: MovieDetails) {
        displayData(data)
        hideLoading()
    }
    
    
    func displayData(_ data: MovieDetails) {
        detailsView.bind(data)
        hideLoading()
    }

}


