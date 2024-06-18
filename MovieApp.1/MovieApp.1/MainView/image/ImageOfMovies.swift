//
//  ImageOfMovies.swift
//  MovieApp.1
//
//  Created by vano Kvakhadze on 07.06.24.
//

import SwiftUI

struct ImageOfMovies: View {
    var movie : Movies
    
    var body: some View {
        if let posterPath = movie.posterPath,
                      let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
                       AsyncImage(url: imageURL) { phase in
                           if let image = phase.image {
                               image
                                   .resizable()
                                   .cornerRadius(16)
                                   .aspectRatio(contentMode: .fill)
                               
                           }
                       } 
            
                   } else {
                       Image(systemName: "photo")
                           .resizable()
                           .cornerRadius(8)
                           .aspectRatio(contentMode: .fill)
                           .foregroundColor(.gray)
                   }
    }
}

