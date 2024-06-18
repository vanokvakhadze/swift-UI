//
//  MoviesView.swift
//  MovieApp
//
//  Created by vano Kvakhadze on 05.06.24.
//

import SwiftUI


struct MoviesView: View {
    @EnvironmentObject var movies: ViewModel
    var columns = [GridItem(.adaptive(minimum: 160)), GridItem(.adaptive(minimum: 160))]
    
    var body: some View {
        ZStack{
            VStack{
                
                HeaderOfMovie(title: "Pupular Moives", content: {
                    Image(systemName: "movieclapper")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.cyan)
                })
                .padding(.bottom, 10)
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(movies.movies, id: \.id) { movie in
                            MoviesList(movie: movie)
                        }
                    }
                }
                .onAppear {
                    movies.fetchData()
                }
            }
            .padding(.horizontal, 10)
            .background(Color(uiColor:
                    .systemGroupedBackground))
        }
    }
}



#Preview {
    MoviesView()
        .environmentObject(ViewModel())
}
