//
//  SearchView.swift
//  MovieApp
//
//  Created by vano Kvakhadze on 05.06.24.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var movies: ViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(movies.filteredMovies, id: \.id) { item in
                    SearchList(movie: item)
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .listRowBackground(Color(UIColor.systemGroupedBackground))
            }
        }
        .searchable(text: $movies.searchText, prompt: "Search")
    }
}

#Preview {
    SearchView()
        .environmentObject(ViewModel())
}
