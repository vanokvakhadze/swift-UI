//
//  ContentView.swift
//  homework30
//
//  Created by vano Kvakhadze on 26.05.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            GeometryReader { reader in
                List{
                    Section(
                        //MARK: header
                        header:
                            HStack (alignment: .center){
                                Text("ხილი")
                                    .bold()
                                    .font(.title)
                                    .foregroundColor(.black)
                                Spacer()
                                Image(.fruit)
                                    .resizable()
                                    .frame(width: 80, height:80)
                                    .cornerRadius(40)
                            },
                        //MARK: footer
                        footer:
                            ZStack(alignment: .leadingLastTextBaseline){
                                VStack{
                                    Spacer()
                                    HStack(alignment: .center){
                                        Spacer()
                                        ZStack(alignment: .topTrailing) {
                                            Image(systemName: "cart")
                                                .resizable()
                                                .foregroundColor(.gray)
                                                .frame(width: 100, height:  100)
                                            ZStack{
                                                Circle()
                                                    .frame(width: 35 ,height: 35)
                                                    .foregroundColor(Color.green)
                                                Text("\(viewModel.totalAmount)")
                                                    .foregroundColor(.white)
                                                    .bold()
                                            }
                                            .padding(-4)
                                        }
                                        Spacer()
                                        Spacer()
                                        VStack{
                                            Text("\(viewModel.totalPrice , specifier: "%.2f") ₾")
                                                .frame(width: 100, height: 40)
                                                .background(Color.gray)
                                                .cornerRadius(10)
                                                .bold()
                                                .foregroundColor(.white)
                                            
                                            Button("გადახადა", action: {
                                                if let url = URL(string: "https://www.google.com") {
                                                    UIApplication.shared.open(url)
                                                }
                                            })
                                            
                                            .frame(width: 150, height: 50)
                                            .background(Color.blue)
                                            .cornerRadius(8)
                                            .foregroundColor(.white)
                                        }
                                        Spacer()
                                    }
                                    .frame(width: reader.size.width, height: 120)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                }
                                Button("-20%", action: {
                                    if viewModel.sale == false {
                                        viewModel.discount()
                                        viewModel.sale = true
                                    }
                                    
                                })  .frame(height: 40)
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                    .padding(.leading, 25)
                                    .buttonStyle(.borderless)
                                
                                
                            })
                    //MARK: celss
                    {
                        ForEach(viewModel.fruits) { item in
                            HStack{
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(Color.brown)
                                    .frame(width: 15)
                                    .padding(.trailing, 5)
                                Image(uiImage: UIImage(named: "\(item.image)") ?? .not)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .scaledToFill()
                                    .cornerRadius(10)
                                
                                VStack (alignment: .leading){
                                    Spacer()
                                    Text("\(item.name)")
                                    Spacer()
                                    Text("მარაგი \(item.supply )")
                                        .font(.system(size: 10))
                                        .foregroundColor(.gray)
                                        .bold()
                                    
                                        .padding(.bottom, 1)
                                    Text("\(item.price, specifier: "%.2f") ₾")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color(UIColor(ciColor: .gray)))
                                    Spacer()
                                }
                                Spacer()
                                VStack{
                                    Text("რაოდენობა (კგ)")
                                        .font(.system(size: 14))
                                        .padding(.bottom, 2)
                                    HStack{
                                        Button( action: {
                                            viewModel.addItem(of: item)
                                        }) {
                                            Image(systemName: "plus.circle")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(Color.green)
                                                .scaledToFit()
                                        } .buttonStyle(.borderless)
                                        
                                        
                                        Text("\(item.amount)")
                                            .font(.system(size: 14))
                                            .frame(minWidth: 40, minHeight: 20)
                                            .background(Color.gray)
                                            .cornerRadius(8)
                                        
                                        Button( action: {
                                            viewModel.removeItem(of: item)
                                        }) {
                                            Image(systemName: "minus.circle")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(Color.red)
                                                .scaledToFit()
                                        }
                                        .buttonStyle(.borderless)
                                        
                                        
                                        Button(action: {
                                            viewModel.deleteAmount(of: item)
                                        }) {
                                            Image(systemName: "multiply.square.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(Color.red)
                                                .scaledToFit()
                                        }
                                        .buttonStyle(.borderless)
                                    }
                                }
                                
                            }
                            .padding(.trailing, 10)
                            
                        }
                        .onDelete(perform: viewModel.deleteFromarray)
                        .frame(height: 75)
                        .background(Color(uiColor:.secondarySystemGroupedBackground))
                        .cornerRadius(10)
                        
                        
                    }
                    
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                    .listRowBackground(Color(UIColor.systemGroupedBackground))
                    
                }
                
            }
            .listStyle(PlainListStyle())
        }
        .toolbar{
            Button( action: {
                
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 15)
            })
        }
    }
    
}


#Preview {
    ContentView()
}
