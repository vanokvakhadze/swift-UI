//
//  FavoriteList.swift
//  MovieApp.1
//
//  Created by vano Kvakhadze on 09.06.24.
//

import SwiftUI

struct FavoriteList: View {
    var movie: Movies
    
    var body: some View {
        
        VStack {
            
            Details(movie: movie, content: {
                
                ImageOfMovies(movie: movie)
                    .frame(maxWidth: .infinity - 60)
            })

        }
        .cornerRadius(8)
       

    }
}

//#Preview {
//    FavoriteList()
//}
