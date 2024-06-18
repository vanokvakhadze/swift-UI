//
//  ContentView.swift
//  MovieApp.1
//
//  Created by vano Kvakhadze on 07.06.24.
//

import SwiftUI
import SwiftData


struct ContentView: View {
   
    @StateObject var viewModel = ViewModel()
    
   
    
    var body: some View {
        VStack {
            TabView {
                MoviesView()
                    .tabItem {
                        Image(systemName: "movieclapper")
                        Text("Movies")
                    }
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass.circle")
                        Text("Search")
                    }
                
                FavoriteView()
                    .tabItem {
                        Image(systemName: "bookmark.fill")
                        Text("Favorite")
                    }
            }
        }.environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
}
