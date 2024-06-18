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
            VStack{
                HStack {
                    searchView
                    
                    Spacer()
                        .frame(width: 19)
                    
                    menuPicker
                        .onChange(of: movies.searchMode) { movies.searchText = ""
                        }
                }
                
                VStack{
                    
                    if movies.searchText.isEmpty {
                        
                        Checking(text1: "Use the magic search!", text2: "I will do my best to search everything relevant, I promise!")
                        
                    } else if movies.isSearchResultsAreEmpty{
                        Checking(text1: "oh no isn’t this so embarrassing? ", text2: "I cannot find any movie with this name")
                        
                    } else {
                        
                        List {
                            
                            if movies.searchMode == .Name {
                                ForEach(movies.filteredByName, id: \.id) { item in
                                    SearchList(movie: item)
                                }
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                
                            } else if  movies.searchMode == .genre  {
                                ForEach(movies.filteredByGenre, id: \.id){ item in
                                    SearchList(movie: item)
                                }
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                
                                
                            } else {
                                ForEach(movies.filterByYear, id: \.id) { item in
                                    SearchList(movie: item)
                                }
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                
                            }
                        }
                        .listStyle(PlainListStyle())
                        .edgesIgnoringSafeArea(.all)
                    }
                }
                Spacer()
            }
            .navigationTitle("Search")
        }
    }
    
        //MARK: search
    var searchView: some View {
        HStack{
            TextField("Try spidermen :)", text: $movies.searchText)
                .foregroundColor(.gray)
            
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.gray)
            
        } .padding()
        
        .background(
           RoundedRectangle(cornerRadius: 16)
               .stroke(Color.gray, lineWidth: 0)
               .background(Color(uiColor: .secondarySystemBackground))
               .frame(width: 283 ,height: 42)
               .cornerRadius(16)
        )
        .frame(width: 283)
    }
    
    
    var menuPicker: some View {
        Menu {
            Picker("Search Mode", selection: $movies.searchMode) {
                ForEach(SearchMode.allCases) { mode in
                    Text(mode.rawValue).tag(mode)
                }
            }
        }
    label:
        {
            Image(systemName: "ellipsis.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundColor(.gray)
        }
    }
    
}



struct Checking: View {

    var text1: String
    var text2: String
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(text1)
                .font(.custom("Montserrat", size: 16))
                .frame(width: 188)
                .multilineTextAlignment(.center)
            
            Spacer()
                .frame(height: 10)
            
            Text(text2)
                .font(.custom("Montserrat", size: 12))
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            
            Spacer()
            
        }
        .frame(width: 252)
    }
}

#Preview {
    SearchView()
        .environmentObject(ViewModel())
}
