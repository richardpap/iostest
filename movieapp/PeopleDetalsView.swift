//
//  PeopleDetalsView.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 04. 22..
//  Copyright © 2017. Richard Pap. All rights reserved.
//

import UIKit
import Kingfisher

class PeopleDetailsView: UIView {
    
    var scrollView = UIScrollView(frame: .zero)
    var contentView = UIStackView(frame: .zero)
    var dataImage = UIImageView(frame: .zero)
    var dataName = UILabel()
    var dataBirth = UILabel()
    var dataBio = UILabel()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        dataImage.translatesAutoresizingMaskIntoConstraints = false
        dataName.translatesAutoresizingMaskIntoConstraints = false
        dataBirth.translatesAutoresizingMaskIntoConstraints = false
        dataBio.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(scrollView)
        scrollView.addSubview(dataImage)
        scrollView.addSubview(contentView)
        
        //contentView.addArrangedSubview(dataImage)
        contentView.addArrangedSubview(dataName)
        contentView.addArrangedSubview(dataBirth)
        contentView.addArrangedSubview(dataBio)
        
        contentView.backgroundColor = .red
        
        contentView.axis = .vertical
        contentView.alignment = .fill
        contentView.distribution = .fill
        contentView.spacing = 10
        
        dataName.font = dataName.font.withSize(24)
        dataBirth.font = dataBirth.font.withSize(12)
        dataBio.font = dataBio.font.withSize(14)
        dataBio.numberOfLines = 0
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
            dataImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            dataImage.heightAnchor.constraint(equalToConstant: 520),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: dataImage.bottomAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            dataName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            dataName.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            dataName.topAnchor.constraint(equalTo: dataImage.bottomAnchor, constant: 10),
            
            dataBirth.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            dataBirth.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            
            dataBio.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            dataBio.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            dataBio.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -60)
            
        ])
        
        super.updateConstraints()
        
    }
    
    
    func bind(peopleData: PeopleDetails) {
        if let imgPath = peopleData.PROFILE_PATH {
            let imgURL = ImageloaderService.getInstance().IMG_HOST + ImageloaderService.getInstance().IMAGE_SIZE_LIST[2] + imgPath
            let imgResource = ImageResource(downloadURL: URL(string: imgURL)!, cacheKey: imgURL)
            dataImage.kf.setImage(with: imgResource)
            dataImage.contentMode = .scaleAspectFill
            dataImage.clipsToBounds = true
        }
        
        if
            let name = peopleData.NAME,
            let bio = peopleData.BIOGRAPHY,
            let birthday = peopleData.BIRTHDAY {
                dataName.text = name
                dataBio.text = bio
                dataBirth.text = birthday
            
        }
    }
}
