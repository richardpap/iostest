//
//  TVDetailsView.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit
import Kingfisher

class TVDetailsView: UIView {
    
    var scrollView = UIScrollView(frame: .zero)
    var contentView = UIStackView(frame: .zero)
    var paramsView = UIStackView(frame: .zero)
    var dataImage = UIImageView(frame: .zero)
    var dataTitle = UILabel()
    var dataGenres = UILabel()
    var dataDescription = UILabel()
    var dataReleased = UILabel()
    var dataRated = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        paramsView.translatesAutoresizingMaskIntoConstraints = false
        dataImage.translatesAutoresizingMaskIntoConstraints = false
        dataTitle.translatesAutoresizingMaskIntoConstraints = false
        dataGenres.translatesAutoresizingMaskIntoConstraints = false
        dataDescription.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.addSubview(dataImage)
        
        contentView.addArrangedSubview(dataTitle)
        contentView.addArrangedSubview(dataGenres)
        contentView.addArrangedSubview(paramsView)
        contentView.addArrangedSubview(dataDescription)
        
        paramsView.addArrangedSubview(dataRated)
        paramsView.addArrangedSubview(dataReleased)
        
        contentView.backgroundColor = .yellow
        contentView.axis = .vertical
        contentView.alignment = .fill
        contentView.distribution = .fill
        contentView.spacing = 10
        
        paramsView.axis = .horizontal
        paramsView.alignment = .fill
        paramsView.distribution = .equalSpacing
        
        dataTitle.font = dataTitle.font.withSize(24)
        dataGenres.font = dataGenres.font.withSize(12)
        dataRated.font = dataGenres.font.withSize(14)
        dataRated.font = dataGenres.font.withSize(14)
        dataReleased.font = dataGenres.font.withSize(14)
        dataDescription.font = dataGenres.font.withSize(14)
        dataDescription.numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func updateConstraints() {
        guard let superview = self.superview else { return }
        
        NSLayoutConstraint.activate([

                leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                topAnchor.constraint(equalTo: superview.topAnchor),
                bottomAnchor.constraint(equalTo: superview.bottomAnchor),

                scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
                scrollView.topAnchor.constraint(equalTo: topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                dataImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                dataImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                dataImage.topAnchor.constraint(equalTo: scrollView.topAnchor),
                dataImage.heightAnchor.constraint(equalToConstant: 400),
                dataImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

                contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                contentView.topAnchor.constraint(equalTo: dataImage.bottomAnchor, constant: 10),
                contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

                dataTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
                dataTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),

                dataGenres.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
                dataGenres.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),

                paramsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
                paramsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),

                dataDescription.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
                dataDescription.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
                dataDescription.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -60)
            
            
            ])
        
        super.updateConstraints()
        
    }
    
    
    func bind(tvData: TVDetails) {
        if let imgPath = tvData.BACKDROP_PATH {
            let imgURL = ImageloaderService.getInstance().IMG_HOST + ImageloaderService.getInstance().IMAGE_SIZE_LIST[2] + imgPath
            let imgResource = ImageResource(downloadURL: URL(string: imgURL)!, cacheKey: imgURL)
            dataImage.kf.setImage(with: imgResource)
            dataImage.contentMode = .scaleAspectFill
            dataImage.clipsToBounds = true
        }
        
        if
            let title = tvData.NAME,
            let overview = tvData.OVERVIEW,
            let rate = tvData.VOTE_AVERAGE,
            let releaseDate = tvData.FIRST_AIR_DATE,
            let genreIds = tvData.GENRES {
                dataTitle.text = title
                dataDescription.text = overview
                dataReleased.text = "First aired: " + releaseDate.substring(to: (releaseDate.index(releaseDate.startIndex, offsetBy: 4)))
                dataRated.text = "Rated: " + String(describing: rate)
            
                var genresListText = ""
            
                for item in genreIds {
                    if (genresListText.characters.count != 0) {
                        genresListText += ", "
                    }
                    if let genreName = item.NAME {
                        genresListText += genreName
                    }
                }
            
                dataGenres.text = genresListText
            
        }
    }
}

