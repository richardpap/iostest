//
//  Loading.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 17..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static let TAG = 123
    static let PROGRESS_TAG = 1001
    
    func showLoading() {
        let container = UIView(frame: .zero)
        let progress = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        let layoutConstraints = [
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.widthAnchor.constraint(equalTo: view.widthAnchor),
            container.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            progress.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            progress.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            progress.widthAnchor.constraint(lessThanOrEqualTo: container.widthAnchor, multiplier: 0.5, constant: 0),
            progress.heightAnchor.constraint(lessThanOrEqualTo: container.heightAnchor)
        ]
        
        view.addSubview(container)
        
        container.addSubview(progress)
        container.tag = UIViewController.TAG
        
        progress.frame = .zero
        progress.tag = UIViewController.PROGRESS_TAG
        
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        progress.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(layoutConstraints)

        progress.startAnimating()
    }

    func hideLoading() {
        guard
            let container = view.viewWithTag(UIViewController.TAG),
            let progress = view.viewWithTag(UIViewController.PROGRESS_TAG) as? UIActivityIndicatorView else {
            return
        }
        
        let layoutConstraints = [
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.widthAnchor.constraint(equalTo: view.widthAnchor),
            container.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            progress.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            progress.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            progress.widthAnchor.constraint(lessThanOrEqualTo: container.widthAnchor, multiplier: 0.5, constant: 0),
            progress.heightAnchor.constraint(lessThanOrEqualTo: container.heightAnchor)
        ]
        
        NSLayoutConstraint.deactivate(layoutConstraints)
        
        progress.stopAnimating()
        container.removeFromSuperview()
    }
}
