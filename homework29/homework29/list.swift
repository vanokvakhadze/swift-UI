//
//  list.swift
//  homework29
//
//  Created by vano Kvakhadze on 24.05.24.
//

import SwiftUI

struct list: View {
    let item: ToDoList
    @State var isActive: Bool
    let moveToCompleted: (ToDoList) -> Void
    
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 0)
                .fill(Color(item.color))
                          .frame(width: 15)
                          .padding(.trailing, 5)
            
            VStack (alignment: .leading) {
                Spacer()
                Text(item.action)
                    .font(.system(size: 16))
                Spacer()
                HStack {
                    Image(systemName: "calendar")
                    Text(item.date)
                        .font(.system(size: 14))
                }
               Spacer()
            }
            Spacer()
            Button {
                isActive.toggle()
                moveToCompleted(item)
                isActive.toggle()
            } label: {
                Image(systemName: isActive ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
                    
            }
            .padding(.trailing, 10)
            
        }
        .frame(height: 80)
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .cornerRadius(10)
        
        
    }
}

#Preview {
    ContentView()
}
