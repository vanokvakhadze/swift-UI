//
//  CharactersView.swift
//  homework32
//
//  Created by vano Kvakhadze on 31.05.24.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var person:  ViewModel

    
    var columns = [GridItem(), GridItem()]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(person.charactersArray) { character in
                        NavigationLink(value: character){
                            
                            AsyncImage(url: URL(string: character.image))
                                .scaledToFill()
                                .frame(width: 180, height: 180)
                                .cornerRadius(10)
                            
                        }
                        
                    }
                }
            }
            .onAppear{
                person.fetchCharacters()
            }
            
            .navigationDestination(for: Characters.self) { item in
                DetailsView(character:  item, episodes: person.charactersEpisodes[item.id] ?? [], episodesCharacters: person.CharactersInEpisodes[item.id] ?? [] )
            }        }
    }
    
}

struct DetailsView : View {
    var character: Characters
    var episodes: [Episodes]
    var episodesCharacters : [Characters]
    @State var isClicked: Int?
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("name:  \(character.name)")
            Text("status:  \(character.status)")
            Text("gender:  \(character.gender)")
            Text("species:  \(character.species)")
            Text("created:  \(ViewModel().convertDateString(character.created) ?? " ")")
            
            Spacer()
            
            ScrollView {
                LazyVStack{
                    ForEach(episodes) { episode in
                        VStack{
                            Spacer()
                            
                            Text("\(episode.name)")
                            
                            Spacer()
                            
                            HStack{
                                Text("\(episode.episode)")
                                    .background(Color.gray)
                                    .cornerRadius(8)
                                    
                                Spacer()
                                    .frame(width: 30)
                                
                                Text("\(episode.air_date)")
                                    .bold()
                                    .font(.system(size: 12))
                                    
                                
                            }
                            .frame(height: 60)
                            Spacer()
                            if isClicked == episode.id {
                                HStack{
                                    ScrollView(.horizontal){
                                        HStack {
                                            ForEach(episodes) { episode in
                                                Text(episode.air_date)
                                                    .frame(width: 180)
                                                    .frame(height: 20)
                                                    .background(Color.gray)
                                                    .cornerRadius(10)
                                            }
                                        }
                                        .padding(.leading, 10)
                                        .padding(.bottom, 10)
                                        .padding(.top, 10)
                                    }
                                }
                            }
                        }
                            .onTapGesture {
                                if isClicked == episode.id {
                                    isClicked = nil
                                } else {
                                    isClicked = episode.id
                                }
                            }
                    }
                    .frame(width: 200)
                   
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                    
                    
                }
                
                .padding()
                
                
            }
            .background(Color.gray)
            
            Spacer()
        }
    }
}
            

#Preview {
    CharactersView(person:  ViewModel())
}
