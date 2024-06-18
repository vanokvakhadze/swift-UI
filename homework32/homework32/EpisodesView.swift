//
//  EpisodesView.swift
//  homework32
//
//  Created by vano Kvakhadze on 31.05.24.
//

import SwiftUI


struct EpisodesView: View {
    @ObservedObject var episode: ViewModel
    @State private var isLiked: [Int: Bool] = [:]
    
    var columns = [GridItem(.fixed(180)), GridItem(.fixed(180))]
    
    var body: some View {
        ScrollView{
            Section(header: sectionHeader){
                LazyVGrid(columns: columns) {
                    ForEach(episode.episodesArray) { episode in
                        ZStack(alignment: .topTrailing) {
                            VStack{
                                Text(episode.name)

                                .frame(width: 170, height: 80)
                                
                                
                                HStack(){
                                    Text(episode.air_date)
                                        .padding(.leading, 5)
                                        .font(.system(size: 12))
                                        .frame(width: 70)
                                       
                                        
                                    Spacer()
                                    
                                    Text(episode.episode)
                                        .padding(.trailing, 5)
                                        .background(Color.brown)
                                        .cornerRadius(4)
                                }
                            }
                            Button(action: {
                                isLiked[episode.id] = !(isLiked[episode.id] ?? false)
                            }){
                                Image( systemName: (isLiked[episode.id] ?? false) ?  "heart.fill" : "heart")
                                    .foregroundColor(.red)
                            }
                            
                        }
                        
                    }
                    .frame(width: 180, height: 140)
                    .background(Color.cyan)
                    .cornerRadius(10)
                }
            }
          
        }
        .onAppear{
            episode.fetchEpisodes()
        }
    }
    
    var sectionHeader: some View {
        
        VStack(alignment: .leading){
            Text("Episodes")
                .padding(.bottom, 10)
                .bold()
        }
            
    }
        
}


#Preview {
    EpisodesView(episode: ViewModel())
}
