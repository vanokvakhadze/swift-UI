//
//  ContentView.swift
//  homework28
//
//  Created by vano Kvakhadze on 22.05.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        Text("Svipti iuai eksesaisi")
            .padding(EdgeInsets(top: 53, leading: 18, bottom: 7, trailing: 49))
            .font(.system(size: 34))
            header
            
    }
        
    
    //MARK: header views
    private var header: some View {
        
        ZStack {
           
            HStack{
                firstVC()
                rowViews
            }
            
     
        }.padding(EdgeInsets(top: 0, leading: 9, bottom: 0, trailing: 23))
            
    }
    // MARK: rowsv views
    private var rowViews: some View {
        
        VStack {
            secondVC()
            thirdVC()
        }
        
    }
    
    
}

#Preview {
    ContentView()
}
