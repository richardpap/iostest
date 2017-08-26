//
//  SearchListViewCell.swift
//  movieapp
//
//  Created by Richard Pap on 2017. 08. 02..
//  Copyright © 2017. Richard Pap. All rights reserved.
//


import UIKit
import Alamofire
import Kingfisher
import SnapKit

class SearchListViewCell: UITableViewCell {
    
    var dataImage = UIImageView(frame: .zero)
    var dataTitle = UILabel()
    var dataDescription = UILabel()
    var dataRate = UILabel()
    var dataGenres = UILabel()
    var dataYear = UILabel()
    var starImage = UIImage(named: "Star")
    var starView = UIImageView(frame: .zero)
    var calendarImage = UIImage(named: "calendar")
    var calendarView = UIImageView(frame: .zero)
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(dataImage)
        contentView.addSubview(dataTitle)
        contentView.addSubview(dataRate)
        contentView.addSubview(starView)
        contentView.addSubview(calendarView)
        contentView.addSubview(dataYear)
        contentView.addSubview(dataGenres)
        contentView.addSubview(dataDescription)
        
        dataImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.height.equalTo(160)
            make.width.equalTo(100)
        }
        
        dataTitle.font = dataTitle.font.withSize(18)
        dataTitle.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(15)
            make.left.equalTo(dataImage.snp.right).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-80)
            make.height.equalTo(24)
        }
        
        starView.image = starImage
        starView.contentMode = .scaleAspectFill
        starView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(15)
            make.right.equalTo(contentView.snp.right).offset(-10)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        dataRate.font = dataTitle.font.withSize(18)
        dataRate.textAlignment = .right
        dataRate.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(15)
            make.right.equalTo(starView.snp.left).offset(-6)
            make.width.equalTo(36)
        }
        
        dataGenres.font = dataGenres.font.withSize(14)
        dataGenres.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(40)
            make.left.equalTo(dataImage.snp.right).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-100)
            make.height.equalTo(24)
        }
        
        calendarView.image = calendarImage
        calendarView.contentMode = .scaleAspectFill
        calendarView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(42)
            make.right.equalTo(contentView.snp.right).offset(-10)
            make.height.equalTo(20)
            make.width.equalTo(24)
        }
        
        dataYear.font = dataGenres.font.withSize(14)
        dataYear.textAlignment = .right
        dataYear.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(40)
            make.right.equalTo(calendarView.snp.left).offset(-6)
            make.height.equalTo(24)
            make.width.equalTo(50)
        }
        
        dataDescription.font = dataGenres.font.withSize(14)
        dataDescription.numberOfLines = 0
        dataDescription.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(80)
            make.left.equalTo(dataImage.snp.right).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-10)
            make.height.equalTo(80)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //override func prepareForReuse() { }
    
    func bind(_ list: [SearchListData], _ index: Int) {
        let media = list[index]
            
        if let imgPath = media.POSTER_PATH {
            let imgURL = ImageloaderService.getInstance().IMG_HOST + ImageloaderService.getInstance().IMAGE_SIZE_LIST[0] + imgPath
            let imgResource = ImageResource(downloadURL: URL(string: imgURL)!, cacheKey: imgURL)
            dataImage.kf.setImage(with: imgResource)
            dataImage.contentMode = .scaleAspectFill
        }
        if let genreIds = media.GENRE_IDS {
            dataGenres.text = getGenresText(genreIds)
        }
        if let rate = media.VOTE_AVERAGE {
            dataRate.text = String(describing: round(10*rate)/10)
        }
        if let releaseDate = media.RELEASE_DATE {
            dataYear.text = checkDate(releaseDate)
        }
        if let title = media.ORIGINAL_TITLE {
            dataTitle.text = checkData(title)
        }
        if let overview = media.OVERVIEW {
            dataDescription.text = checkData(overview)
        }
    }
    
    
    func checkData(_ data: String) -> String {
        if data.characters.count > 0 {
            return data
        } else {
            return "No Data"
        }
    }
    
    
    func checkDate(_ data: String) -> String {
        if data.characters.count > 3 {
            return data.substring(to: (data.index(data.startIndex, offsetBy: 4)))
        } else {
            return "????"
        }
    }
    
    
    func getGenresText(_ genreIds: [Int]) -> String {
        var genresListText = ""
        var filteredArray = [GenresList]()
        
        for item in genreIds {
            filteredArray += GenresService.getInstance().GENRES_LIST.filter({$0.ID == item})
        }
        
        for item in filteredArray {
            if let genreName = item.NAME {
                if (genresListText.characters.count != 0) {
                    genresListText += ", "
                }
                
                genresListText += genreName
            }
        }
        
        return genresListText
    }
}

