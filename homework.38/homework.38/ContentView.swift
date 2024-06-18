//
//  ContentView.swift
//  homework.38
//
//  Created by vano Kvakhadze on 16.06.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        MainPage(viewModel: viewModel)
    }
}

#Preview {
    ContentView()
}
