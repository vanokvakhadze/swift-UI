//
//  FavoriteView.swift
//  MovieApp.1
//
//  Created by vano Kvakhadze on 08.06.24.
//

import SwiftUI
import SwiftData

struct FavoriteView: View {
    
    @EnvironmentObject var movies: ViewModel
    @State var path = NavigationPath()
    
    var columns = [GridItem(.adaptive(minimum: 100)), GridItem(.adaptive(minimum: 100)), GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        NavigationStack(path: $path){
            ZStack{
                VStack{
                    
                    HeaderOfMovie(title: "Favorites", content: {
                        Image(systemName: "popcorn.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.yellow)
                    })
                    .padding(.bottom, 10)
                    
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(movies.favorite) { movie in
                                NavigationLink(value: movie) {
                                    FavoriteList(movie: movie)
                                }
                            }
                            
                        }
                    }
                    .overlay{
                        if movies.favorite.isEmpty {
                            Checking(text1: "No favourites yet", text2: "All moves marked as favourite will be added here")
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
                DetailsView(details: item, path: $path, navTitle: "Favorite")
                    .navigationTitle(item.title)
                
                
            }
        }
    }
}



//
//#Preview {
//    FavoriteView()
//}
