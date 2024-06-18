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
        
        VStack{
            HStack {
                
                Text(movie.title)
                    .font(.custom("Cochin", size: 14))

                Spacer()
            }
            .frame(height: 40)
            .padding(.leading, 10)
            
            HStack{
                
                Text("About")
                    .font(.system(size: 10))
                
                Spacer()
                
                Text("\(movie.releaseDate)")
                    .font(.system(size: 10))
                    .foregroundStyle(Color.gray)
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            
            
            VStack {
                
                Text(movie.overview)
                    .lineLimit(2)
                    .font(.system(size: 8))
                    .foregroundStyle(Color(uiColor: .darkGray))
                    
                
            }.padding(EdgeInsets(top: 5, leading: 10, bottom: 10, trailing: 10))
        }
    }
}
