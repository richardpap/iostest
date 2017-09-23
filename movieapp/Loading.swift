
import UIKit
import SnapKit

extension UIViewController {
    
    static let TAG = 123
    static let PROGRESS_TAG = 1001
    
    func showLoading() {
        let container = UIView(frame: .zero)
        let progress = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        
        view.addSubview(container)
        container.addSubview(progress)
        container.tag = UIViewController.TAG
        container.backgroundColor = .white
        progress.frame = .zero
        progress.tag = UIViewController.PROGRESS_TAG
        
        container.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(view)
            make.height.equalTo(view)
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
        
        progress.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(container)
            make.height.equalTo(container)
            make.centerX.lessThanOrEqualTo(container)
            make.centerY.equalTo(container)
        }
        
        progress.startAnimating()
    }

    func hideLoading() {
        guard
            let container = view.viewWithTag(UIViewController.TAG),
            let progress = view.viewWithTag(UIViewController.PROGRESS_TAG) as? UIActivityIndicatorView
        else {
            return
        }
        
        container.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(view)
            make.height.equalTo(view)
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
        
        progress.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(container)
            make.height.equalTo(container)
            make.centerX.lessThanOrEqualTo(container).multipliedBy(0.5).offset(0)
            make.centerY.equalTo(container)
        }

        
        progress.stopAnimating()
        container.removeFromSuperview()
    }
}
