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
                ImageOfMovies(movie: movie)
                    .frame(width: 95, height: 120)
                    .cornerRadius(16)
                    
            VStack (alignment: .leading){
                Text(movie.title)
                    .lineLimit(1)
                    .font(.custom("Poppins", size: 16))
                    .padding(.bottom, 14)
                
                HStack{
                    SmallImages(imageOf: .star)
                    
                    Text("\(String(format: "%.1f", movie.rating))")
                        .font(.custom("Poppins", size: 12))
                        .foregroundColor(.orange)
                }
                
                HStack{
                    SmallImages(imageOf: .ticket)
                    
                    Text(movie.genres[0])
                        .font(.custom("Poppins", size: 12))
                }
                
                HStack{
                    SmallImages(imageOf: .calendar)
                    
                    Text(movie.releaseDate.prefix(4))
                        .font(.custom("Poppins", size: 12))
                }
                
                HStack{
                    SmallImages(imageOf: .time)
                    
                    Text("139 minutes")
                        .font(.custom("Poppins", size: 12))
                }
                
               
            }
            
            
        }
        .frame(height: 120, alignment: .leading)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(8)
        
      
        
    }
}
