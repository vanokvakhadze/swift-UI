//
//  Networking.swift
//  homework32
//
//  Created by vano Kvakhadze on 31.05.24.
//

import Foundation


class Networking {

    enum NetworkError: Error {
        case decodeError
        case wrongResponse
        case wrongStatusCode(code: Int)
    }
    
    func getData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }

            guard let response = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.wrongResponse))
                return
            }

            guard (200...299).contains(response.statusCode) else {
                completion(.failure(NetworkError.wrongStatusCode(code: response.statusCode)))
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
                print("Error decoding data: \(error.localizedDescription)")
            
                completion(.failure(NetworkError.decodeError))
                
            }
        }.resume()
    }
}
