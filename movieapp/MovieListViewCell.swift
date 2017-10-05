
import UIKit
import Alamofire
import Kingfisher

class MovieListViewCell: UITableViewCell {
    
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
        
        setImgLayout()
        setTitleLayout()
        setParamsLayout()
        setDescriptionLayout()
    }
    
    func setImgLayout() {
        dataImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.height.equalTo(160)
            make.width.equalTo(100)
        }
    }
    
    func setTitleLayout() {
        dataTitle.font = dataTitle.font.withSize(18)
        dataTitle.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(15)
            make.left.equalTo(dataImage.snp.right).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-80)
            make.height.equalTo(24)
        }
    }
    
    func setParamsLayout() {
        starView.image = starImage
        starView.contentMode = .scaleAspectFill
        starView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(15)
            make.right.equalTo(contentView.snp.right).offset(-10)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        dataRate.font = dataRate.font.withSize(18)
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
        
        dataYear.font = dataYear.font.withSize(14)
        dataYear.textAlignment = .right
        dataYear.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(40)
            make.right.equalTo(calendarView.snp.left).offset(-6)
            make.height.equalTo(24)
            make.width.equalTo(50)
        }
    }
    
    func setDescriptionLayout() {
        dataDescription.font = dataDescription.font.withSize(14)
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
    
    
    func bind(_ item: MovieList) {
        if let imgPath = item.POSTER_PATH {
            let imgURL = ImageloaderService.shared().IMG_HOST + ImageloaderService.shared().IMAGE_SIZE_LIST[0] + imgPath
            let imgResource = ImageResource(downloadURL: URL(string: imgURL)!, cacheKey: imgURL)
            dataImage.kf.setImage(with: imgResource)
            dataImage.contentMode = .scaleAspectFill
        }
        if let genreIds = item.GENRE_IDS {
            dataGenres.text = GenresService.shared().getGenresText(genreIds)
        } else {
            dataGenres.text = "No data"
        }
        if let rate = item.VOTE_AVERAGE {
            dataRate.text = String(describing: round(10*rate)/10)
        } else {
            dataRate.text = "????"
        }
        if let releaseDate = item.RELEASE_DATE {
            dataYear.text = checkDate(releaseDate)
        } else {
            dataYear.text = "0000"
        }
        if let title = item.ORIGINAL_TITLE {
            dataTitle.text = title
        } else {
            dataTitle.text = "No data"
        }
        if let overview = item.OVERVIEW {
            dataDescription.text = overview
        } else {
            dataDescription.text = "No data"
        }
    }
    
    func checkDate(_ data: String) -> String {
        if data.characters.count > 3 {
            let index = data.index(data.startIndex, offsetBy: 4)
            return String(data[..<index])
        } else {
            return "????"
        }
    }
}
