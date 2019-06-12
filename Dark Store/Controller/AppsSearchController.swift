//  AppsSearchController.swift
//  Dark Store

//  Created by George Garcia on 6/3/19.
//  Copyright © 2019 GeeTeam. All rights reserved.

import UIKit

class AppsSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellID = "1234"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)
        
        fetchITunesApps()
    }
    
    // Local Variable
    fileprivate var appResults = [Result]()
    
    fileprivate func fetchITunesApps() { // need to try to get back our search results. in order to do that, use a completion block
        APIService.shared.fetchApps { (results, error) in
            
            if let error = error {
                print("Failed to fetch apps: ", error)
                return
            }
            
            self.appResults = results
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        return .init(width: view.frame.width, height: 350) // 1)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell
        
        let appResult = appResults[indexPath.item]
        cell.nameLabel.text     = appResult.trackName
        cell.categoryLabel.text = appResult.primaryGenreName
        cell.ratingsLabel.text  = "Rating: \(appResult.averageUserRating ?? 0)"
        
        return cell
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/* MARK: NOTES
    1)
    // changing the height from 250 to 350 (why isnt the top view also affected?). SV needs to layout somehow.
 

 */
