//
//  SplashScreen.swift
//  MovieApp.1
//
//  Created by vano Kvakhadze on 08.06.24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        }else {
            
            VStack{
                VStack{
                    Image(.splashScreen)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 215, height: 215)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self.isActive = true
                    
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
