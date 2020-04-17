//
//  AppsController.swift
//  Dark Store
//
//  Created by George Garcia on 4/16/20.
//  Copyright © 2020 GeeTeam. All rights reserved.
//

import UIKit

class AppsController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "id"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .yellow
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellID)
    }
}

extension AppsController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppsGroupCell
        return cell
    }
}

extension AppsController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
    
}
