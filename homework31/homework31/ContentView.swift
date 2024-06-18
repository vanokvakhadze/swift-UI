//
//  ContentView.swift
//  homework31
//
//  Created by vano Kvakhadze on 29.05.24.
//

import SwiftUI
struct ContentView: View {
    @StateObject var travel = ViewModel()
    @State var path = NavigationPath()
    @State var isShowed = false
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                
                HStack {
                    
                    Text("Travel around the world")
                        .frame(width: 160,height: 70)
                        .padding(.leading, 10)
                        .lineSpacing(3)
                        .font(.custom("Roboto", size: 22))
                        
                    Spacer()
                    
                    hintsButton
                
                }
                    .frame(height: 120)
                    .background(Color.gray)
                
                List {
                    ForEach(travel.travelPlaces) { item in
                        NavigationLink(value: item) {
                            getList(item: item)
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color(UIColor.systemGroupedBackground))
                }
                .listStyle(PlainListStyle())
            }
            .navigationDestination(for: Travel.self) { item in
                DetailsView(detail: item, path: $path)
            }
           
        }
    }
    //MARK: list
    func getList(item: Travel) -> some View {
        HStack {
            Spacer()
            
            Image(uiImage: UIImage(named: "\(item.Countryimage)") ?? UIImage())
                .resizable()
                .frame(width: 70, height: 70)
                .scaledToFill()
                .cornerRadius(15)
            
            HStack {
                VStack{
                    Image(systemName: "airplane")
                        .resizable()
                        .frame(width: 25,height: 25)
                        .foregroundColor(.mint)
                        .scaleEffect(x: -1, y: 1)
                        .padding(.bottom, 10)
                    
                    Text("\(item.country)")
                        .frame(width: 120, height: 30)
                        .background(Color.green)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                }
            }
        }
        .frame(height: 100)
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .cornerRadius(12)
    }
    
    
    private var hintsButton: some View {
        VStack {
            Button("Travel Tips ") {
                isShowed = true
            }
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 30)
            .background(Color.blue)
            .font(.system(size: 16))
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.trailing, 10)
            .alert(isPresented: $isShowed) {
                Alert(
                    title: Text("\(travel.getHints.randomElement() ?? "")"),
                    primaryButton: .destructive(Text("OK")), secondaryButton: .cancel()
                )
            }
            Spacer()
        }
    }
}



#Preview {
    ContentView()
}
