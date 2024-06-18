//
//  DetailsView.swift
//  MovieApp.1
//
//  Created by vano Kvakhadze on 08.06.24.
//

import SwiftUI
import SwiftData 


struct DetailsView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    var details: Movies
    @Binding var path: NavigationPath
    
    var navTitle: String
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                ZStack(alignment: .top){
                  
                    BackgroundImage(movie: details)
                        .frame(height: 210)
                        .cornerRadius(16)
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.init(uiColor: .systemBackground))
                        .frame(height: 20)
                        
                    
                    VStack {
                        HStack{
                            HStack(alignment: .lastTextBaseline){
                                ImageOfMovies(movie: details)
                                    .frame(width: 75, height: 120)
                                
                                Text(details.title)
                                    .frame(width: 210, height: 48)
                                    .font(.custom("Poppins", size: 18))
                                
                            }
                            
                            HStack{
                                rating
                            }.padding(.top, -32)
                            
                        }.padding(.bottom, 16)
                    }
                    .padding(.top, 145)
                }
                
                VStack{
                    description
                        .padding(.bottom, 24)
                    
                    VStack(alignment: .leading) {
                        
                        HStack{
                            Text("About Movie")
                                .frame(height: 33)
                                .font(.custom("Poppins", size: 14))
                            
                            Spacer()
                            
                            Button(action: {
                                viewModel.toggleFavoriteStatus(movie: details) {
                                    self.path.removeLast()
                                }
                            }) {
                                Image(systemName: (viewModel.isLiked[details.id] ?? false) ? "heart.fill" : "heart")
                                    .foregroundColor(.red)
                            }
                        }
                        Rectangle()
                            .frame(height: 4)
                            .foregroundColor(.gray)
                        
                    }
                    .padding(.bottom, 24)
                    
                    Text(details.overview)
                        .font(.custom("Poppins", size: 18))
                    
                }
                .padding(.horizontal, 24)
                
                Spacer()
                    .background(Color .gray)
            }
            
        } 
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        
    }
    
//MARK: backButton
    var backButton: some View {
            Button(action: {
                self.path.removeLast()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text(navTitle)
                }
            }
        }
    
    
    
    //MARK: Description
    var description: some View {
        HStack{
            
            HStack{
                SmallImages(imageOf: .calendar)
                
                Text(details.releaseDate.prefix(4))
                    .font(.custom("Poppins", size: 12))
                
                Image(.line)
                    .resizable()
                    .frame(width: 1, height: 16)
                    .scaledToFill()
                
            }
            
            HStack{
                
                SmallImages(imageOf: .time)
                
                Text("149 minutes")
                    .font(.custom("Poppins", size: 12))
                
                Image(.line)
                    .resizable()
                    .frame(width: 1, height: 16)
                    .scaledToFill()
            }
            
            HStack{
                
                SmallImages(imageOf: .ticket)
                
                Text(details.genres[0])
                    .font(.custom("Poppins", size: 12))
            }
        }
    }
    
    var rating: some View{
        HStack{
            SmallImages(imageOf: .star)
            
            Text("\(String(format: "%.1f", details.rating))")
                .font(.custom("Poppins", size: 12))
                .foregroundColor(.orange)
            
        }
        .frame(width: 54, height: 24)
        .background(.gray)
        .cornerRadius(8)
    
    }
}

#Preview {
    MoviesView()
        .environmentObject(ViewModel())
}
