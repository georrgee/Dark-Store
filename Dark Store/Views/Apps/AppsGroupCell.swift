//
//  AppsGroupCell.swift
//  Dark Store
//
//  Created by George Garcia on 4/16/20.
//  Copyright © 2020 GeeTeam. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
    
}

class AppsGroupCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "App Section", font: .boldSystemFont(ofSize: 30))
    
    let horizontalController = AppsHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .purple
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: .none, trailing: trailingAnchor)
        
        addSubview(horizontalController.view)
        horizontalController.view.backgroundColor = .red
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
