//  SearchResultCell.swift
//  Dark Store
//  Created by George Garcia on 6/4/19.
//  Copyright © 2019 GeeTeam. All rights reserved.


import UIKit

class SearchResultCell: UICollectionViewCell {
    
    var appResultCell: Result! {
        didSet {
            
            nameLabel.text     = appResultCell.trackName
            categoryLabel.text = appResultCell.primaryGenreName
            ratingsLabel.text  = "Rating: \(appResultCell.averageUserRating ?? 0)"
            
            let appIconURL = URL(string: appResultCell.artworkUrl100)
            appIconImageView.sd_setImage(with: appIconURL)
            screenShotImageView1.sd_setImage(with: URL(string: appResultCell.screenshotUrls[0]))
            
            
            if appResultCell.screenshotUrls.count > 1 {
                screenShotImageView2.sd_setImage(with: URL(string: appResultCell.screenshotUrls[1]))
            }
            
            if appResultCell.screenshotUrls.count > 2 {
                screenShotImageView3.sd_setImage(with: URL(string: appResultCell.screenshotUrls[2]))
            }
        }
    }
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "App Name"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photo & Video"
        return label
    }()
    
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "5.26M"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = .darkGray
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var screenShotImageView1 =  self.createScreenShotImageView() // access instance variables and functions
    lazy var screenShotImageView2 =  self.createScreenShotImageView()
    lazy var screenShotImageView3 =  self.createScreenShotImageView()
    
    func createScreenShotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelsStackView = VerticalStackView(arrangeSubViews: [nameLabel, categoryLabel, ratingsLabel])
        
        let infoTopStackView     = UIStackView(arrangedSubviews: [appIconImageView, labelsStackView, getButton])
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        
        let screenshotsStackView     = UIStackView(arrangedSubviews: [screenShotImageView1, screenShotImageView2, screenShotImageView3])
        screenshotsStackView.spacing = 12
        screenshotsStackView.distribution = .fillEqually
        
        let overallStackView = VerticalStackView(arrangeSubViews: [infoTopStackView, screenshotsStackView], spacing: 16)
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16)) // 1)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


/* MARK: NOTES
 
 1)        We don't need to use this code below here since we can add in a Helper File called UIView+Layout which can make our code cleaner
           With one line of code, we can make a reference from that helper file
 
           // stackView.translatesAutoresizingMaskIntoConstraints = false
           // stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
           // stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true /// provides us the space on the left side
           // stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
           // stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true /// provides us the space on the right side
 
 
 
 
 */
