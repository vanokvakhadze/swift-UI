//
//  HeaderOfMovie.swift
//  MovieApp
//
//  Created by vano Kvakhadze on 06.06.24.
//

import SwiftUI

struct HeaderOfMovie<Content:View>: View {
    var title: String
    var content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.title = title
    }
    
    var body: some View {
        HStack{
            Text(title)
                .font(.custom("Roboto", size: 18))
                .bold()
            
            Spacer(minLength: 50)
            
            content
        }
    }
}


