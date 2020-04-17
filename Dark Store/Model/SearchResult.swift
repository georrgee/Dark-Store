//  SearchResult.swift
//  Dark Store
//  Created by George Garcia on 6/7/19.
//  Copyright © 2019 GeeTeam. All rights reserved.

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results:     [Result]
}

struct Result: Decodable {
    let trackName:         String
    let primaryGenreName:  String
    let averageUserRating: Float?
    let screenshotUrls:    [String]
    let artworkUrl100:     String
}
