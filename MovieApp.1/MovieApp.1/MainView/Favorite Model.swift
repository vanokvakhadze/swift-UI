//
//  Favorite Model.swift
//  MovieApp.1
//
//  Created by vano Kvakhadze on 10.06.24.
//

import Foundation
import SwiftData

@Model
class Favoritegen: Identifiable {
    @Attribute var id: Int
    @Attribute var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
  
}


@Model
class FavoriteMov: Identifiable {
    @Attribute(.unique) var id: Int
    @Attribute var background: String?
    @Attribute var rating: Double
    @Attribute var title: String
    @Attribute var overview: String
    @Attribute var posterPath: String?
    @Attribute var releaseDate: String
    @Relationship var genres: [String] = []
                            
    init(movies: Movies) {
        self.id = movies.id
        self.background = movies.background
        self.rating = movies.rating
        self.title = movies.title
        self.overview = movies.overview
        self.posterPath = movies.posterPath
        self.releaseDate = movies.releaseDate
        self.genres = movies.genres
    }
                            
}
