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
        
        starView.image = starImage
        starView.contentMode = .scaleAspectFill
        
        calendarView.image = calendarImage
        calendarView.contentMode = .scaleAspectFill
        
        dataImage.translatesAutoresizingMaskIntoConstraints = false
        dataTitle.translatesAutoresizingMaskIntoConstraints = false
        dataDescription.translatesAutoresizingMaskIntoConstraints = false
        dataRate.translatesAutoresizingMaskIntoConstraints = false
        dataGenres.translatesAutoresizingMaskIntoConstraints = false
        starView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        dataYear.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(dataImage)
        contentView.addSubview(dataTitle)
        contentView.addSubview(dataRate)
        contentView.addSubview(starView)
        contentView.addSubview(calendarView)
        contentView.addSubview(dataYear)
        contentView.addSubview(dataGenres)
        contentView.addSubview(dataDescription)
        
        dataTitle.font = dataTitle.font.withSize(18)
        dataRate.font = dataTitle.font.withSize(18)
        dataRate.textAlignment = .right
        dataGenres.font = dataGenres.font.withSize(14)
        dataYear.font = dataGenres.font.withSize(14)
        dataYear.textAlignment = .right
        dataDescription.font = dataGenres.font.withSize(14)
        dataDescription.numberOfLines = 0
        
        
        NSLayoutConstraint.activate([
            
            dataImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            dataImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            dataImage.heightAnchor.constraint(equalToConstant: 160),
            dataImage.widthAnchor.constraint(equalToConstant: 100),
            
            dataTitle.leadingAnchor.constraint(equalTo: dataImage.trailingAnchor, constant: 10),
            dataTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -80),
            dataTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            dataTitle.heightAnchor.constraint(equalToConstant: 24),
            
            starView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            starView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            starView.widthAnchor.constraint(equalToConstant: 24),
            starView.heightAnchor.constraint(equalToConstant: 24),
            
            dataRate.trailingAnchor.constraint(equalTo: starView.leadingAnchor, constant: -6),
            dataRate.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            dataRate.widthAnchor.constraint(equalToConstant: 35),
            
            dataGenres.leadingAnchor.constraint(equalTo: dataImage.trailingAnchor, constant: 10),
            dataGenres.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100),
            dataGenres.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            dataGenres.heightAnchor.constraint(equalToConstant: 24),
            
            calendarView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            calendarView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 42),
            calendarView.widthAnchor.constraint(equalToConstant: 24),
            calendarView.heightAnchor.constraint(equalToConstant: 20),
            
            dataYear.trailingAnchor.constraint(equalTo: calendarView.leadingAnchor, constant: -6),
            dataYear.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            dataYear.widthAnchor.constraint(equalToConstant: 50),
            dataYear.heightAnchor.constraint(equalToConstant: 24),
            
            dataDescription.leadingAnchor.constraint(equalTo: dataImage.trailingAnchor, constant: 10),
            dataDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dataDescription.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 80),
            dataDescription.heightAnchor.constraint(lessThanOrEqualToConstant: 80)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {

    }
    
    
    func bind(_ list: [SearchListData], _ index: Int) {
        

            let media = list[index]
            
            if let imgPath = media.POSTER_PATH {
                let imgURL = ImageloaderService.getInstance().IMG_HOST + ImageloaderService.getInstance().IMAGE_SIZE_LIST[0] + imgPath
                let imgResource = ImageResource(downloadURL: URL(string: imgURL)!, cacheKey: imgURL)
                dataImage.kf.setImage(with: imgResource)
                dataImage.contentMode = .scaleAspectFill
            }
            
            if
                let genreIds = media.GENRE_IDS,
                let rate = media.VOTE_AVERAGE,
                let releaseDate = media.RELEASE_DATE,
                let title = media.ORIGINAL_TITLE,
                let overview = media.OVERVIEW {
                dataGenres.text = getGenresText(genreIds)
                dataRate.text = String(describing: round(10*rate)/10)
                dataYear.text = checkDate(releaseDate)
                dataTitle.text = checkData(title)
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

