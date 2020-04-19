//  AppRowCell.swift
//  Dark Store
//  Created by George Garcia on 4/18/20.
//  Copyright © 2020 GeeTeam. All rights reserved.

import UIKit

class AppRowCell: UICollectionViewCell {
    
    let imageView    = UIImageView(cornerRadius: 8)
    let nameLabel    = UILabel(text: "App Name", font: .systemFont(ofSize: 16))
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    let getButton    = UIButton(title: "GET")
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .purple
        
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        imageView.backgroundColor = .black
        
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.layer.cornerRadius = 32 / 2
        getButton.backgroundColor = .lightGray
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    
        let stackView = UIStackView(arrangedSubviews: [imageView, VerticalStackView(arrangeSubViews: [nameLabel, companyLabel], spacing: 4), getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// CMD + OPT/ALT + CTRL + F = FIX ERRORS OR FILL missing code
