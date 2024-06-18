//
//  ViewModel.swift
//  homework31
//
//  Created by vano Kvakhadze on 29.05.24.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    //@Published var hints = travelHints
    @Published var travelPlaces: [Travel] =  places
    @Published var getHints = travelHints
    
}
