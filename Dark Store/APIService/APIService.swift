//
//  APIService.swift
//  Dark Store
//
//  Created by George Garcia on 6/11/19.
//  Copyright © 2019 GeeTeam. All rights reserved.
//

import Foundation

class APIService {
    
    static let shared = APIService() // creating a singleton
    
    func fetchApps(completion: @escaping ([Result], Error?) -> () ) {
        
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        // fetch data with from Internet
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let err = error {
                print("Failed to fetch apps:", err)
                completion([], nil)
                return
            }
            
            // when it is successful
            guard let data = data else { return }
            
            do {
                
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
                
                //searchResult.results.forEach({ print($0.trackName, $0.primaryGenreName) })
                
            } catch let jsonError { // catch let -> rename error
                print("Failed to decode json!", jsonError)
                completion([], jsonError)
            }
            
            }.resume() // make a request
    }
    
}
