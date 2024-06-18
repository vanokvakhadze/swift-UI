//
//  SwiftChangeText.swift
//  homework.38
//
//  Created by vano Kvakhadze on 17.06.24.
//

import SwiftUI

struct SwiftChangeText: View {
    @Environment(\.dynamicTypeSize) var dynamicSize
    
    @Binding var news: Panicks
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                Text(news.title)
                    .lineLimit(6)
                    .bold()
                    .minimumScaleFactor(dynamicSize.customScaleFactor)
            }
            
            Spacer()
                .frame(height: 70)
            
            HStack(alignment: .bottom){
                Spacer()
                
                Text(news.time)
                    .font(.system(size: 12))
                    .foregroundStyle(.gray)
                    .minimumScaleFactor(dynamicSize.customScaleFactor)
                Spacer()
                    .frame(width: 10)
                
            }
            Spacer()
            
        }
    }
    }


