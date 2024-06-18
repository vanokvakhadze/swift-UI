//
//  SearchList.swift
//  MovieApp
//
//  Created by vano Kvakhadze on 06.06.24.
//

import SwiftUI




struct SearchList: View {
    var movie: Movies
    
    var body: some View {
        
        HStack {
            
            Details(movie: movie, content: {
                ImageOfMovies(movie: movie)
                    .frame(width: 135, height: 135)
            })
             .frame(minHeight: 170)
            
   
        }
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(8)
        
    }
}
