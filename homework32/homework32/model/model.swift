//
//  model.swift
//  homework32
//
//  Created by vano Kvakhadze on 31.05.24.
//

import Foundation

struct APIResult: Decodable {
    let results: [Characters]
}

struct Characters: Decodable, Identifiable , Hashable{

    
    var id: Int
    var name: String
    var status: String
    var gender: String
    var image: String
    var species: String
    var created: String
    var episode: [String]
   
}


struct EpisodeResult: Decodable {
    var results: [Episodes]
}

struct Episodes: Decodable, Identifiable, Hashable {
    var id: Int
    var name: String
    var air_date: String
    var episode: String
    var characters: [String]
    var url: String
    var created: String
    
}
