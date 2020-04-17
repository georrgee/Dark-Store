//
//  AppsHorizontalController.swift
//  Dark Store
//
//  Created by George Garcia on 4/16/20.
//  Copyright © 2020 GeeTeam. All rights reserved.
//

import UIKit

class AppsHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .blue
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
}

extension AppsHorizontalController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

let topBottomPadding: CGFloat = 12
let lineSpacing: CGFloat = 10

extension AppsHorizontalController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing) / 3
        return .init(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: topBottomPadding, left: 16, bottom: topBottomPadding, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
