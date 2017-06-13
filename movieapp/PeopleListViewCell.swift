//
//  TVListViewCell.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import Kingfisher

class PeopleListViewCell: UITableViewCell {
    
    var dataImage = UIImageView(frame: .zero)
    var dataName = UILabel()
    var dataMovies = UILabel()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        dataImage.translatesAutoresizingMaskIntoConstraints = false
        dataName.translatesAutoresizingMaskIntoConstraints = false
        dataMovies.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(dataImage)
        contentView.addSubview(dataName)
        contentView.addSubview(dataMovies)
      
        dataName.font = dataName.font.withSize(18)
        dataMovies.font = dataMovies.font.withSize(14)
        dataMovies.numberOfLines = 0
        
        
        NSLayoutConstraint.activate([
            
            dataImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            dataImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            dataImage.heightAnchor.constraint(equalToConstant: 160),
            dataImage.widthAnchor.constraint(equalToConstant: 100),
            
            dataName.leadingAnchor.constraint(equalTo: dataImage.trailingAnchor, constant: 10),
            dataName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -80),
            dataName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            dataName.heightAnchor.constraint(equalToConstant: 24),
            
            dataMovies.leadingAnchor.constraint(equalTo: dataImage.trailingAnchor, constant: 10),
            dataMovies.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dataMovies.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            dataMovies.heightAnchor.constraint(lessThanOrEqualToConstant: 110)
            
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func bind(_ list: [PeopleList], _ index: Int) {
        let media = list[index]
        
        if let imgPath = media.PROFILE_PATH {
            let imgURL = ImageloaderService.getInstance().IMG_HOST + ImageloaderService.getInstance().IMAGE_SIZE_LIST[0] + imgPath
            let imgResource = ImageResource(downloadURL: URL(string: imgURL)!, cacheKey: imgURL)
            dataImage.kf.setImage(with: imgResource)
            dataImage.contentMode = .scaleAspectFill
        }
        
        if

            let name = media.NAME,
            let movieIds = media.KNOWN_FOR {
                dataName.text = name
                dataMovies.text = setMovies(movieIds)
        }
    }
    
    func setMovies(_ movieIds: [KnownFor]) -> String {
        var moviesText = ""
        
        for item in movieIds {
            if (moviesText.characters.count != 0) {
                moviesText += ", "
            }
            
            if let movieTitle = item.TITLE {
                moviesText += movieTitle
            }
        }
        
        return moviesText
    }

}
