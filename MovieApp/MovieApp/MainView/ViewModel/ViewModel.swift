//
//  ViewModel.swift
//  MovieApp
//
//  Created by vano Kvakhadze on 05.06.24.
//

import Foundation

final class ViewModel: ObservableObject {
    var id = UUID()
    @Published var movies: [Movies] = []
    @Published var searchText: String = ""
    
    
    var filteredMovies: [Movies] {
        movies.filter({$0.title.localizedStandardContains(searchText)})
    }
    
    func fetchData() {
        let apiKey = "ade29cf1c5ce4fd397de69467c11c03f"
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"
        
        Networking().getData(urlString: urlString) { [weak self] (result: Result<Results, Error>) in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self?.movies = success.results
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
}
