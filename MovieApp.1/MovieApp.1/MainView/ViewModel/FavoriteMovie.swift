//
//  Favorite.swift
//  MovieApp.1
//
//  Created by vano Kvakhadze on 09.06.24.
//

import Foundation
import SwiftData

class FavoriteManager: ObservableObject {
    @Published var favorite: [Movies] = []
    @Published var isLiked: [Int: Bool] = [:]
    
    func addToFavorites(movie: Movies) {
        if !favorite.contains(where: { $0.id == movie.id }) {
            favorite.append(movie)
            isLiked[movie.id] = true
        }
    }
    
    func removeFromFavorites(movie: Movies) {
        if let index = favorite.firstIndex(where: { $0.id == movie.id }) {
            favorite.remove(at: index)
            isLiked[movie.id] = false
        }
    }
    
    func toggleFavoriteStatus(movie: Movies, onUnlike: () -> Void) {
        if isLiked[movie.id] ?? false {
            removeFromFavorites(movie: movie)
            onUnlike()
        } else {
            addToFavorites(movie: movie)
        }
    }
}
