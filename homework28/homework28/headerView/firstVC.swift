//
//  firstVC.swift
//  homework28
//
//  Created by vano Kvakhadze on 23.05.24.
//

import SwiftUI

struct firstVC: View {
    @State var text = "We love property wrappers and closures"
    
    @State var clicked = false
    
    var body: some View {
        ZStack {
           
            Image(.guitar)
                .resizable()
                .scaledToFill()
                .frame(width: 82, height: 182)
                .padding(EdgeInsets(top: 60, leading: 83, bottom: 0, trailing: 0))
                .background(Color(hex: 0xF7BB36))
                .cornerRadius(18)
                .padding()
            VStack {
                Button( action: {
                    if clicked == false  {
                        text = "We love ტეილორ swift"
                        clicked = true
                    }else {
                        text = "We love property wrappers and closures"
                        clicked = false
                    }
                }) {
                    Image(.microphone)
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                .padding(EdgeInsets(top: 12, leading: 16, bottom: 2, trailing: 117))
                
                Text("ჯუზონები და რამე ")
                    .font(.system(size: 9))
                    .padding(EdgeInsets(top: 2, leading: 16, bottom: 0, trailing: 67))
                
                Text(text)
                    .font(.system(size: 17))
                    .frame(width: 108, height: 88)
                    .padding(EdgeInsets(top: 52, leading: 16, bottom: 33, trailing: 41))
                
            }
            .foregroundColor(Color.white)
//            .background(Color(hex: 0xF7BB36))
//            .cornerRadius(18)
         
          
           
              
        }
        
    }
    
    
}


#Preview {
    firstVC()
}
