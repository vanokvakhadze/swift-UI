//
//  thirdVC.swift
//  homework28
//
//  Created by vano Kvakhadze on 23.05.24.
//

import SwiftUI

struct thirdVC: View {
    var body: some View {
        ZStack{
            Image(.airpods)
                .resizable()
                .frame(width: 66, height: 68)
                .padding(EdgeInsets(top: 39, leading: 104, bottom: 0, trailing: 0))
                .background(Color(hex: 0x7F36F7))
                .cornerRadius(18)
            
            VStack {
                Button(action: {
                    
                }) {
                    Image(.user)
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                .padding(EdgeInsets(top: 22, leading: 16, bottom: 0, trailing: 117))
                
                
                Text("ცეცხლოვანი სიახლეები")
                    .font(.system(size: 9))
                    .frame(width: 61, height: 26)
                    .padding(EdgeInsets(top: 5, leading: 16, bottom: 28, trailing: 88))
                
            }
            .foregroundColor(.white)
//            .background(Color(hex: 0x7F36F7))
//            .cornerRadius(18)
//            Image(.airpods)
//                .resizable()
//                .frame(width: 66, height: 68)
//                .padding(EdgeInsets(top: 24, leading: 99, bottom: 0, trailing: 0))
//                //.background(Color(hex: 0x7F36F7))
//                .cornerRadius(18)
        }
    }
}

#Preview {
    thirdVC()
}
