//
//  ContentView.swift
//  homework32
//
//  Created by vano Kvakhadze on 31.05.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        TabView {
            CharactersView(person:  viewModel)
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Characters")
                }
            
            EpisodesView(episode: viewModel)
                .tabItem {
                Image(systemName: "film.circle")
                Text("Episodes")
            }
            
            SearchView(search: viewModel)
                .tabItem {
                    Image(systemName: "magnifyingglass.circle")
                    Text("Search")
                }
        }
    }
}

#Preview {
    ContentView()
}
