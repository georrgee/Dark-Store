//
//  VerticalStackView.swift
//  Dark Store
//
//  Created by George Garcia on 6/6/19.
//  Copyright © 2019 GeeTeam. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {
    
    init(arrangeSubViews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        
        self.spacing = spacing
        self.axis    = .vertical
        
        arrangeSubViews.forEach( { addArrangedSubview($0) }) // 1)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


/* MARK: NOTES
 
    1) forEach = Pretty much goes through the entire array
       $0      = represents one of the objects inside the array
 
 
 */
