//
//  DetailsView.swift
//  homework31
//
//  Created by vano Kvakhadze on 30.05.24.
//

import SwiftUI

struct DetailsView: View {
    @ObservedObject var detail: Travel
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Text("\(detail.country)")
                .font(.largeTitle)
            
            Image(uiImage: UIImage(named: "\(detail.cityImage)") ?? UIImage())
                .resizable()
                .frame(width: 300, height: 300)
                .scaledToFill()
                .cornerRadius(8)
            
            Text("\(detail.city)")
                .font(.custom("Roboto", size: 22))
                .padding(.top, 25)
                .foregroundColor(.gray)
            
            Spacer()
            Spacer()
            Spacer()
            
            HStack(alignment: .bottom) {
                Spacer()
                
                NavigationLink("Transport", value: detail.transport)
                    .frame(width: 100, height: 35)
                    .background(Color(.gray))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                
                Spacer()
                
                NavigationLink("Must See", value: detail.mustSeenPlaces)
                    .frame(width: 100, height: 35)
                    .background(Color(.cyan))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                Spacer()
                
                NavigationLink("Hotels", value: detail.hotel)
                    .frame(width: 100, height: 35)
                    .background(Color(.blue))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                
                Spacer()
            }
            Spacer()
        }
        .navigationDestination(for: Travel.Transport.self) { value in
            TransportView(transport: value, path: $path)
        }
        
        .navigationDestination(for: Travel.Sightseeing.self) { value in
            MustSeeView(must: value, path: $path)
        }
        
        .navigationDestination(for: Travel.Hotel.self) { item in
            HotelsView(hotels: item, path: $path)
        }
    }
}

//MARK: transport view
struct TransportView: View {
    @ObservedObject var transport: Travel.Transport
    @Binding var path:  NavigationPath
    
    var body: some View {
        
        VStack{
            Spacer()
            
            Text("To Airport")
                .frame(width: 140,height:45)
                .background(Color.gray)
                .cornerRadius(15)
            
            HStack(){
                Image(systemName: "airplane.circle")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.orange)
                    .padding(.trailing, 15)
                
                Text("\(transport.airplane)")
                    .font(.system(size: 24))
                    .padding(.leading, 15)
                
            }   .padding(.bottom, 15)
                .padding(.top, 15)
            Spacer()
            Spacer()
            
            Text("From Airport")
                .frame(width: 140,height:45)
                .background(Color.gray)
                .cornerRadius(15)
            
            HStack(){
                Image(systemName: "bus.doubledecker")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.indigo)
                    .padding(.trailing, 15)
                
                Text("\(transport.bus)")
                    .font(.system(size: 24))
                    .padding(.leading, 15)
            }
            .padding(.bottom, 15)
            .padding(.top, 15)
            
            HStack{
                Image(systemName: "car.front.waves.up")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.teal)
                    .padding(.trailing, 15)
                
                Text("\(transport.car)")
                    .font(.system(size: 24))
                    .padding(.leading, 15)
            }
            .padding(.bottom, 15)
            .padding(.top, 15)
            
            Spacer()
            Button("Go To Main", action: {
                path.removeLast(path.count)
            })
            .frame(width: 140, height: 60)
            .background(Color.blue)
            .cornerRadius(10)
            .foregroundColor(.white)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        
    }
}



//MARK: hotel view
    struct HotelsView : View {
        @ObservedObject var hotels: Travel.Hotel
        @Binding var path:  NavigationPath
        
        var body: some View {
           
                VStack{
                    Text("\(hotels.name)")
                        .bold()
                        .font(.headline)
                        
                     
                    Image(uiImage: UIImage(named: "\(hotels.image)") ?? UIImage())
                        .resizable()
                        .frame(width: 300, height: 300)
                        .scaledToFill()
                        .cornerRadius(8)
                    
                    Spacer()
                    
                    HStack{
                        Image(systemName: "bed.double.circle")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.mint)
                            .padding(.trailing, 15)
                        
                        Text("\(hotels.price) $")
                            .bold()
                            .font(.system(size: 22))
                            .padding(.leading, 15)
                           
                    }
                   
                    
                    Spacer()
                    
                    Button("go to home") {
                        path.removeLast(path.count)
                        
                    }
                    .frame(width: 140, height: 60)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                
                    Spacer()
                .navigationBarBackButtonHidden(true)
            }
        }
    }
    
//MARK: must see view
struct MustSeeView: View {
    @ObservedObject var must: Travel.Sightseeing
    @Binding var path:  NavigationPath
    
    var body: some View {
     
            VStack{
                ForEach(must.mustSeenPlaces, id: \.self) { text in
                    Text("\(text)")
                        .multilineTextAlignment(.leading)
                        .padding()
                        
                }
                
                Button("Go to home page", action: {
                    path.removeLast(path.count)
                })
                .frame(width: 140, height: 60)
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
            }
    }
}
#Preview {
    ContentView()
}
