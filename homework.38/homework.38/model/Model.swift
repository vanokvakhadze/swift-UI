//
//  Model.swift
//  homework.38
//
//  Created by vano Kvakhadze on 17.06.24.
//
import Foundation


struct Panicks: Decodable, Equatable, Hashable {
    var title: String
    var time: String
    var url: String
    var photoUrl: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case time = "Time"
        case url = "Url"
        case photoUrl = "PhotoUrl"
    }
}
 
struct News: Decodable, Equatable, Hashable{
    var list: [Panicks]
    
    enum CodingKeys: String, CodingKey {
        case list = "List"
    }
}
