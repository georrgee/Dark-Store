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
    
    
    fileprivate func fetchITunesApps() {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        // fetch data with from Internet
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let err = error {
                print("Failed to fetch apps:", err)
                return
            }
            
            // when it is successful
            guard let data = data else { return }
            
            do {

                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                searchResult.results.forEach({ print($0.trackName, $0.primaryGenreName) })
                
                //print(searchResult) // showing the result
            } catch let jsonError { // catch let -> rename error
                print("Failed to decode json!", jsonError)
            }
            
        }.resume() // make a request
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        return .init(width: view.frame.width, height: 350) // 1)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell
        cell.nameLabel.text = "Facebook"
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
