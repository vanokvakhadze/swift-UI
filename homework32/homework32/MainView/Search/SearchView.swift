//
//  SearchView.swift
//  homework32
//
//  Created by vano Kvakhadze on 31.05.24.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var search: ViewModel
    
    var body: some View {
        
          NavigationStack {
              VStack {
                  Picker("Search Mode", selection: $search.searchMode) {
                      ForEach(SearchMode.allCases) { mode in
                          Text(mode.rawValue).tag(mode)
                      }
                  }
                      .pickerStyle(SegmentedPickerStyle())
                      .padding()
                      .accentColor(.brown)
                      .onChange(of: search.searchMode) { search.searchText = "" }
                  
                  ScrollView {
                      LazyVStack{
                          if search.searchMode == .characters {
                              ForEach(search.filteredCharacter, id: \.id) { item in
                                  Text(item.name)
                              }
                          } else   {
                              ForEach(search.filteredEpisodes, id: \.id){ item in
                                  Text(item.name)
                              }
                          }
                      }
                  }
              }
          }
          .searchable(text: $search.searchText, prompt: "Search")
      }
  }

#Preview {
    SearchView(search: ViewModel())
}


