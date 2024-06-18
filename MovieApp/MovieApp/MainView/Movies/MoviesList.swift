//
//  customList.swift
//  MovieApp
//
//  Created by vano Kvakhadze on 05.06.24.
//

import SwiftUI

struct MoviesList: View {
    var movie: Movies
    
    var body: some View {
        
        VStack {
            
            Details(movie: movie, content: {
                
                ImageOfMovies(movie: movie)
                    .frame(maxWidth: .infinity - 60)
            })

        }
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(8)
       

    }
}


