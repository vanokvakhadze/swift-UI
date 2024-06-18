//
//  model.swift
//  homework30
//
//  Created by vano Kvakhadze on 26.05.24.
//

import Foundation
import SwiftUI
 
struct Market: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var price: Double
    var amount: Int
    var supply: Int
    var image: String
}


