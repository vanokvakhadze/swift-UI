//
//  SearchMode.swift
//  MovieApp.1
//
//  Created by vano Kvakhadze on 08.06.24.
//

import Foundation

enum SearchMode: String, CaseIterable, Identifiable {
    case Name = "Name"
    case genre = "Genre"
    case Year = "Year"
    
    var id: String { self.rawValue }
}
