//
//  ContentView.swift
//  MovieApp
//
//  Created by vano Kvakhadze on 05.06.24.
//

import SwiftUI

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
            }
        }.environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
}
