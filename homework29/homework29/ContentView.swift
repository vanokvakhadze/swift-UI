//
//  ContentView.swift
//  homework29
//
//  Created by vano Kvakhadze on 24.05.24.
//

import SwiftUI

struct ContentView: View {
    var totalTask = toDoList
    var numberOfTotal = toDoList.count
    @State var completedTask: [ToDoList] = []
    @State var toDoTask: [ToDoList] = toDoList

//MARK: ღილაკის შემდეგ რომ უნდა ისქროლებდოს გამომრჩა ეგ და ისეთ დროს გამახსენდა ვერარ ვასწრებ 
    var body: some View {
        
        VStack {
            ZStack{
                HStack{
                    Spacer()
                    Text("You have \(totalTask.count - completedTask.count) tasks to complete ")
                        .frame(width: 188, height: 50)
                        .font(.custom("Roboto", size: 20))
                        .fontWeight(.semibold)
                    Spacer(minLength: 136)
                    Image(.image)
                        .resizable()
                        .frame(width: 44, height: 45)
                        .scaledToFill()
                        .padding(2)
                        .background(LinearGradient(gradient: Gradient(colors: [ Color(hex: 0xBA83DE),  Color(hex: 0xD9D9D9)]), startPoint: .top, endPoint: .bottom))
                        .clipShape(Circle())
                        .overlay(
                            circle
                                .padding(.bottom, -5),
                            alignment: .bottomTrailing
                        )
                    Spacer(minLength: 25)
                }
            }
            Spacer(minLength: 35)
            Button("Complete All",
                   action:{
                completeAll()
            })
                .frame(width: 367, height: 50)
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [ Color(hex: 0x73ABFF),  Color(hex: 0x46C0C2)]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(8)
            
                HStack{
                    Text("Progress")
                        .padding(20)
                        .font(.custom("Roboto", size: 22))
                        .fontWeight(.light)
                    Spacer()
                }
                progress
                Spacer(minLength: 25)
                listItems
                
            
        }
            .background(Color(uiColor:
            .systemGroupedBackground))
        
        
    }
    //MARK: progress view
    var progress: some View {
        let percent: Double = Double(completedTask.count) / Double(numberOfTotal) * 100
        return HStack{
            VStack {
                Spacer()
                HStack{
                    Text("Daily Tasks")
                        .padding(.leading, 16)
                        .font(.system(size: 18))
                        .font(.custom("Inter", size: 18))
                        .fontWeight(.bold)
                    Spacer()
                }
                Spacer()
                HStack{
                    Text("Task Completed")
                        .padding(.leading, 16)
                        .font(.custom("Inter", size: 16))
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer(minLength: 15)
                    Text("\(completedTask.count)/\(numberOfTotal) Keep Working")
                        .frame(width: 110)
                        .font(.custom("Inter", size: 12))
                        .foregroundColor(.gray)
                    Spacer(minLength: 160)
                    Text("\(percent, specifier: "%.1f")%")
                        .font(.system(size: 12))
                    Spacer(minLength: 34)
                    
                }
                progressBar(width: 332, height: 20, totalPercent: 100, completedPercent: CGFloat(percent) )
                Spacer()
            }
            .frame(width: 361, height: 139)
            .background(Color(UIColor.secondarySystemGroupedBackground))
            .cornerRadius(8)
        }
    }
    
    //MARK: small circle above of lelas's photo
    var circle : some View {
        ZStack{
            Circle()
                .frame(width: 15, height: 15)
                .foregroundColor(Color.orange)
            Text("\(completedTask.count)")
                .font(.system(size: 9))
                .foregroundColor(.white)
        }
    }
    
    //MARK: List
    
    var listItems : some View {
        
        VStack {
            HStack{
                Text("Completed Tasks ")
                    .padding(.horizontal, 20)
                    .font(.custom("Roboto", size: 20))
                Spacer()
            }
            List {
                Section{
                    ForEach(completedTask) { item in
                        list(item: item, isActive: true, moveToCompleted:  moveToCompleted)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
                            .listRowBackground(Color(UIColor.systemGroupedBackground))
                    }
                }
                .listSectionSpacing(10)
                Section{
                    ForEach(toDoTask){ item in
                        list(item: item, isActive: false,  moveToCompleted:  moveToCompleted)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
                            .listRowBackground(Color(UIColor.systemGroupedBackground))
                    }
                }
            }
            .listStyle(PlainListStyle())
            .edgesIgnoringSafeArea(.all)
        }
    }
    
//MARK: logics ამ ლოგიკებზე მინდა ფიდბექი შემეძლო ესე დამეწერა თუ მოვაშორო და მეორედ აღარ დავწერო? :დ
    private func moveToCompleted(item: ToDoList) {
           if let index = toDoTask.firstIndex(of: item) {
               toDoTask.remove(at: index)
               completedTask.append(item)
           } else if let index = completedTask.firstIndex(of: item) {
               completedTask.remove(at: index)
               toDoTask.append(item)
           }
       }
    
    private  func completeAll() {
        completedTask.removeAll()
        completedTask = totalTask
        toDoTask.removeAll()
    }

}
#Preview {
    ContentView()
}
