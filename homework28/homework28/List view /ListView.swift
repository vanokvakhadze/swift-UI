//
//  ListView.swift
//  homework28
//
//  Created by vano Kvakhadze on 23.05.24.
//

import SwiftUI

struct ListView: View {
  
    @State var clicked = true
    
    var arr = classWork
    
    var body: some View {
        ContentView()
        list
            .background(Color(hex: 0x19252B))
            .edgesIgnoringSafeArea(.all)
    }
    
    
    private var list: some View {
        ZStack {
            
            GeometryReader { proxy in
                List {
                    ForEach(arr, id: \.id) { item in
                        HStack {
                            Image(.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .frame(width: proxy.size.width * 0.6, alignment: .leading)
                                    .font(.system(size: 14))
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                                Text(item.text)
                                    .frame(width: proxy.size.width * 0.6, alignment: .leading)
                                    .font(.system(size: 10))
                                    .foregroundColor(.gray)
                            }
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 0))
                            
                        }
                    }
                }
                
                .selectionDisabled(true)
            }
            Button(action: {
                clicked.toggle()
            }) {
                Image(systemName: "arrow.clockwise.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .scaledToFit()
                    .padding(EdgeInsets(top: 330, leading: 315, bottom: 69, trailing: 10))
                    .tint(clicked ? Color.blue : Color.gray)
            }
        }
    }
        
}

#Preview {
    ListView()
}
