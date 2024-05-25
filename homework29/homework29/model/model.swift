//
//  model.swift
//  homework29
//
//  Created by vano Kvakhadze on 24.05.24.
//

import Foundation
import SwiftUI

struct ToDoList: Identifiable, Hashable {
    var id = UUID()
    var action: String
    var date: String
    var color: Color
 
  
    
   
    
   
}

var toDoList = [ToDoList(action: "Mobile App Research", date: "4 oct", color: .first),  ToDoList(action: "Prepare Wireframe for Main Flow", date: "4 oct", color: .second), ToDoList(action: "Prepare Screens", date: "4 oct", color: .third), ToDoList(action: "Website Research", date: "5 oct", color: .first), ToDoList(action: "Prepare Wireframe for Main Flow", date: "5 oct", color: .second), ToDoList(action: "Prepare Screens", date: "5 oct", color: .third) ]
