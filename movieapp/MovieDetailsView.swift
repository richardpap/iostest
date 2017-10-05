
import UIKit
import Alamofire
import Kingfisher
import SnapKit

class DetailsView: UIView {
    
    var scrollView = UIScrollView()
    var contentView = UIStackView()
    var paramsView = UIStackView()
    var dataImage = UIImageView()
    var dataTitle = UILabel()
    var dataGenres = UILabel()
    var dataDescription = UILabel()
    var dataReleased = UILabel()
    var dataRuntime = UILabel()
    var dataRated = UILabel()
    unowned var sw: UIView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }
    
    func setView(_ view: UIView) {
        self.sw = view

        backgroundColor = .white
        addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        scrollView.addSubview(dataImage)
        
        contentView.addArrangedSubview(dataTitle)
        contentView.addArrangedSubview(dataGenres)
        contentView.addArrangedSubview(paramsView)
        contentView.addArrangedSubview(dataDescription)
        
        paramsView.addArrangedSubview(dataRated)
        paramsView.addArrangedSubview(dataRuntime)
        paramsView.addArrangedSubview(dataReleased)
        
        setViewLayout()
        setContentLayout()
        setImgLayout()
        setTitleLayout()
        setParamsLayout()
        setDescriptionLayout()
    }
    
    
    func setViewLayout() {
        scrollView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.sw)
            make.right.equalTo(self.sw)
            make.top.equalTo(self.sw)
            make.bottom.equalTo(self.sw).inset(60)
        }
    }
    
    func setImgLayout() {
        dataImage.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(scrollView)
            make.right.equalTo(scrollView)
            make.top.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(400)
        }
    }
    
    
    func setContentLayout() {
        contentView.axis = .vertical
        contentView.alignment = .fill
        contentView.distribution = .fill
        contentView.spacing = 10
        contentView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(scrollView).offset(10)
            make.right.equalTo(scrollView).offset(-10)
            make.top.equalTo(dataImage.snp.bottom).offset(10)
            make.bottom.equalTo(scrollView)
        }
    }
    
    
    func setTitleLayout() {
        dataTitle.font = dataTitle.font.withSize(24)
        dataTitle.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
        }
    }
    
    func setParamsLayout() {
        dataGenres.font = dataGenres.font.withSize(12)
        dataGenres.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
        }
        
        paramsView.axis = .horizontal
        paramsView.alignment = .fill
        paramsView.distribution = .equalSpacing
        paramsView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
        }
        
        dataRated.font = dataRated.font.withSize(14)
        dataRuntime.font = dataRuntime.font.withSize(14)
        dataReleased.font = dataReleased.font.withSize(14)
    }
    
    
    func setDescriptionLayout() {
        dataDescription.font = dataDescription.font.withSize(14)
        dataDescription.numberOfLines = 0
        dataDescription.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.bottom.equalTo(contentView)
        }
    }
    
    func bind(_ movieData: MovieDetails) {
        if let imgPath = movieData.BACKDROP_PATH {
            let imgURL = ImageloaderService.shared().IMG_HOST + ImageloaderService.shared().IMAGE_SIZE_LIST[2] + imgPath
            let imgResource = ImageResource(downloadURL: URL(string: imgURL)!, cacheKey: imgURL)
            dataImage.kf.setImage(with: imgResource)
            dataImage.contentMode = .scaleAspectFill
            dataImage.clipsToBounds = true
        }
        
        if let title = movieData.ORIGINAL_TITLE {
           dataTitle.text = title
        }
        if let overview = movieData.OVERVIEW {
            dataDescription.text = overview
        }
        if let runtime = movieData.RUNTIME {
            dataRuntime.text = "Runtime: " + String(describing: runtime) + "m"
        }
        if let rate = movieData.VOTE_AVERAGE {
            dataRated.text = "Rated: " + String(describing: rate)
        }
        if let releaseDate = movieData.RELEASE_DATE {
            let index = releaseDate.index(releaseDate.startIndex, offsetBy: 4)
            let year = releaseDate[..<index]
            dataReleased.text = "Released: " + year
        }
        if let genreIds = movieData.GENRES {
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
