//  BaseListController.swift
//  Dark Store
//  Created by George Garcia on 4/16/20.
//  Copyright © 2020 GeeTeam. All rights reserved.

import UIKit

class BaseListController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
