//
//  Networking.swift
//  MovieApp.1
//
//  Created by vano Kvakhadze on 07.06.24.
//

import Foundation

class Networking {

    enum NetworkError: Error {
        case decodeError
        case wrongResponse
        case wrongStatusCode(code: Int)
        case customError(description: String)
        
    }
    
    func getData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
            guard let url = URL(string: urlString) else {
                completion(.failure(NetworkError.customError(description: "Invalid URL")))
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completion(.failure(NetworkError.wrongStatusCode(code: (response as? HTTPURLResponse)?.statusCode ?? -1)))
                    return
                }

                guard let data = data else {
                    completion(.failure(NetworkError.decodeError))
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let object = try decoder.decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(object))
                    }
                } catch {
                    completion(.failure(NetworkError.decodeError))
                }
            }.resume()
        }
}
