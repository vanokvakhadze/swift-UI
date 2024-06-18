//
//  BackgroundImage.swift
//  MovieApp.1
//
//  Created by vano Kvakhadze on 08.06.24.
//

import SwiftUI

struct BackgroundImage: View {
    var movie : Movies
    
    var body: some View {
        ZStack(alignment: .top){
            
            if let background = movie.background,
               let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(background)") {
                AsyncImage(url: imageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
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
}


