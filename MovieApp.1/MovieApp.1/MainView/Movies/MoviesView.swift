//
//  MoviesView.swift
//  MovieApp
//
//  Created by vano Kvakhadze on 05.06.24.
//

import SwiftUI


struct MoviesView: View {
    @EnvironmentObject var movies: ViewModel
    @State var path = NavigationPath()
    
    var columns = [GridItem(.adaptive(minimum: 100)), GridItem(.adaptive(minimum: 100)), GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        NavigationStack(path: $path){
            ZStack{
                VStack{
                    
                    HeaderOfMovie(title: "Movies", content: {
                        Image(systemName: "popcorn.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.yellow)
                    })
                    .padding(.bottom, 10)
                    
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(movies.movies, id: \.id) { movie in
                                NavigationLink(value: movie) {
                                    MoviesList(movie: movie)
                                }
                            }
                            
                        }
                    }
                    
                    .onAppear {
                        movies.fetchMoviesAndGenres()
                    }
                    
                  
                    
                }
                .padding(.horizontal, 10)
                .background(Color(uiColor:
                        .systemGroupedBackground))
            }
        .navigationDestination(for: Movies.self) { item in
            DetailsView(details: item, path: $path, navTitle: "Movies")
                .navigationTitle(item.title)
        
            
        }
    }
 }
}



#Preview {
    MoviesView()
        .environmentObject(ViewModel())
}
