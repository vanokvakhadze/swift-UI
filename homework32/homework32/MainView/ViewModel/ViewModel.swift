//
//  ViewMode.swift
//  homework32
//
//  Created by vano Kvakhadze on 31.05.24.
//

import Foundation
import Combine

enum SearchMode: String, CaseIterable, Identifiable {
    case characters = "Characters"
    case episodes = "Episodes"
    
    var id: String { self.rawValue }
}


class ViewModel: ObservableObject, Hashable {
    var id = UUID()
    
    @Published var charactersArray: [Characters] = []
    @Published var charactersEpisodes: [Int: [Episodes]] = [:]
    @Published var episodesArray: [Episodes] = []
    @Published var CharactersInEpisodes: [Int: [Characters]] = [:]
    
    @Published var searchText = ""
    @Published var searchMode: SearchMode = .characters
    
    var filteredCharacter : [Characters] {
       charactersArray.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
                
    }
    
    var filteredEpisodes: [Episodes] {
        episodesArray.filter({$0.name.localizedStandardContains(searchText)})
    }
    
    
    // MARK: fetchCharacters
    func fetchCharacters() {
        let urlString = "https://rickandmortyapi.com/api/character"
        
        Networking().getData(urlString: urlString) { [weak self] (result: Result<APIResult, Error>) in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self?.charactersArray = success.results
                    self?.fetchEpisodesForCharacters(characters: success.results)                    
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    
    private func fetchEpisodesForCharacters(characters: [Characters]) {
        for character in characters {
            fetchEpisodesOfCharacter(for: character)
        }
    }
    
    
    private func fetchEpisodesOfCharacter(for character: Characters) {
        for episodeURL in character.episode {
            Networking().getData(urlString: episodeURL) { (result: Result<Episodes, Error>) in
                switch result {
                case .success(let episode):
                    self.charactersEpisodes[character.id, default: []].append(episode)
                case .failure(let error):
                    print("Error fetching episode: \(error.localizedDescription)")
                }
            }
        }
    }
    
    
    
    func fetchEpisodes(){
        let urlString = "https://rickandmortyapi.com/api/episode"
        
        Networking().getData(urlString: urlString) { [weak self] (result: Result<EpisodeResult, Error>) in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self?.episodesArray = success.results
                    self?.fetchEpisodesForCharactersInEpisodes(episodes: success.results)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    private func fetchEpisodesForCharactersInEpisodes(episodes: [Episodes]) {
        for character in episodes {
            fetchCharacterInEpisodes(for: character)
        }
    }
    
    
    private func fetchCharacterInEpisodes(for episode: Episodes) {
        for episodeURL in episode.characters {
            Networking().getData(urlString: episodeURL) { (result: Result<Characters, Error>) in
                switch result {
                case .success(let success):
                    self.CharactersInEpisodes[episode.id, default: []].append(success)
                case .failure(let error):
                    print("Error fetching episode: \(error.localizedDescription)")
                }
            }
        }
    }
    
    
    
    
    func convertDateString(_ dateString: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        inputFormatter.timeZone = TimeZone(abbreviation: "UTC")
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        if let date = inputFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd-MM-yyyy"
            outputFormatter.timeZone = TimeZone.current
            outputFormatter.locale = Locale.current
            
            let formattedDateString = outputFormatter.string(from: date)
            return formattedDateString
        } else {
            return nil
        }
    }
    
    
    static func == (lhs: ViewModel, rhs: ViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
