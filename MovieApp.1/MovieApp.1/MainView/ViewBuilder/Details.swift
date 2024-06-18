//
//  ViewBuilder.swift
//  MovieApp
//
//  Created by vano Kvakhadze on 06.06.24.
//

import SwiftUI

//MARK: დეტალები გავიტაე ცალკე view builder-ში, მაგრამ ფოტო არ წამოვიღე რადგან სერჩის დროს სხვანაირად მაქვს განლაგებული ვიუს წყობა

struct Details<Content:View>: View {
    var movie: Movies
    var content: Content
    
    init(movie: Movies, @ViewBuilder content: () -> Content) {
        self.movie = movie
        self.content = content()
    }
    
    var body: some View {
        
        content
        
        VStack(alignment: .center){
            
                Text(movie.title)
                    .font(.custom("Cochin", size: 14))
                    .foregroundStyle(.black)
            Spacer()
            }
    }
}
