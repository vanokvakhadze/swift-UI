//
//  ViewModel.swift
//  MovieApp
//
//  Created by vano Kvakhadze on 05.06.24.
//

import Foundation
import SwiftData


final class ViewModel: ObservableObject {
    var id = UUID()
    @Published var movies: [Movies] = []
    @Published var genres: [Genres] = []
    @Published var searchText: String = ""
    @Published var isLiked:[Int: Bool] = [:]
    @Published var favorite:[Movies] = []
    @Published var searchMode: SearchMode = .Name
    
    
    private let favoriteManager = FavoriteManager()
    
    private let apiKey = "ade29cf1c5ce4fd397de69467c11c03f"
    
    
    var filteredByName: [Movies] {
        movies.filter({$0.title.localizedStandardContains(searchText)})
    }
    
    var filteredByGenre: [Movies] {
        movies.filter({$0.genres.contains(searchText)})
    }
    
    var filterByYear: [Movies] {
        guard let targetYear = Int(searchText) else { return []}
        return movies.filter { movie in
            let releaseYear = String(movie.releaseDate.prefix(4))
            return releaseYear == String(targetYear)
        }
        
    }
    
    //MARK: Check if searchText contains any filter
    var isSearchResultsAreEmpty: Bool {
        switch searchMode {
        case .Name:
            return filteredByName.isEmpty
        case .genre:
            return filteredByGenre.isEmpty
        case .Year:
            return filterByYear.isEmpty
        }
    }
    
    //MARK: fetch movies
    
    func fetchMovies(completion: @escaping () -> Void) {
        
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"
        
        Networking().getData(urlString: urlString) { [weak self] (result: Result<Results, Error>) in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self?.movies = success.results
                    completion()
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    //MARK: fetch genres
    func fetchGenres() {
        
        let urlString = "https://api.themoviedb.org/3/genre/movie/list?api_key=\(apiKey)"
        
        Networking().getData(urlString: urlString) { [weak self] (result: Result<ResultGenres, Error>) in
            switch result {
            case .success(let response):
                self?.genres = response.genres
                self?.updateMoviesWithGenres()
            case .failure(let error):
                print("Failed to fetch genres: \(error.localizedDescription)")
            }
        }
    }
    
    //MARK: update movies
    private func updateMoviesWithGenres() {
        
        let genreDict = Dictionary(uniqueKeysWithValues: genres.map { ($0.id, $0.name) })
        self.movies = self.movies.map { movie in
            var updatedMovie = movie
            updatedMovie.genres = movie.genre.compactMap { genreDict[$0] }
            return updatedMovie
        }
    }
    
    //MARK: fetch movies with genres
    
    func fetchMoviesAndGenres() {
        fetchMovies {
            self.fetchGenres()
        }
    }
    
    
    
    func addToFavorites(movie: Movies) {
        favoriteManager.addToFavorites(movie: movie)
        updateFavorites()
    }
    
    func removeFromFavorites(movie: Movies) {
        favoriteManager.removeFromFavorites(movie: movie)
        updateFavorites()
    }
    
    func toggleFavoriteStatus(movie: Movies, onUnlike: () -> Void) {
        favoriteManager.toggleFavoriteStatus(movie: movie, onUnlike: onUnlike)
        updateFavorites()
    }
    
    private func updateFavorites() {
        favorite = favoriteManager.favorite
        isLiked = favoriteManager.isLiked
    }
    
}
