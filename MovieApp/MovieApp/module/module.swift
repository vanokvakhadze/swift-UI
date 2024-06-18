//
//  module.swift
//  MovieApp
//
//  Created by vano Kvakhadze on 05.06.24.
//

import Foundation

struct Results: Decodable {
    let results: [Movies]
}

struct Movies: Decodable, Hashable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let releaseDate: String
    
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
   
    }
}
