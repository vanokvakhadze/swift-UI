//
//  secondVC.swift
//  homework28
//
//  Created by vano Kvakhadze on 23.05.24.
//

import SwiftUI

struct secondVC: View {
    @State var isClicked = true
    
    var body: some View {
        ZStack {
            Image(.chat)
                .resizable()
                .scaledToFit()
                .frame(width: 97, height: 93)
                .padding(EdgeInsets(top: 12, leading: 85, bottom: 0, trailing: -10))
                .background(isClicked ? Color(hex: 0xFF844B) : Color.cyan)
                .cornerRadius(18)

            VStack{
                Button(action: {
                    isClicked.toggle()
                }) {
                    Image(.chatimage)
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                .padding(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 117))
                
                
                Text("ჩათაობა")
                    .font(.system(size: 9))
                    .padding(EdgeInsets(top: 2, leading: 16, bottom: 41, trailing: 111))
            }
            //.background(Color.black)
        }
    }
    
}


#Preview {
    secondVC()
}
