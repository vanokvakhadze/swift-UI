//
//  Module.swift
//  MovieApp.1
//
//  Created by vano Kvakhadze on 07.06.24.
//

import Foundation
import SwiftData


struct Results: Codable {
    let results: [Movies]
}


struct Movies: Codable, Hashable, Identifiable{
    let id: Int
    let background: String?
    let rating: Double
    var genre: [Int]
    var genres: [String] = []
    let title: String
    let overview: String
    let posterPath: String?
    let releaseDate: String
    
    
    
    
    enum CodingKeys: String, CodingKey {
        case id, title,  overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case genre = "genre_ids"
        case background = "backdrop_path"
        case rating = "vote_average"
   
    }
}

struct ResultGenres: Codable, Hashable {
    var genres: [Genres]
}

struct Genres: Codable, Hashable {
    var id: Int
    var name: String
}
