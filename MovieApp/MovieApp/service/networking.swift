//
//  networking.swift
//  MovieApp
//
//  Created by vano Kvakhadze on 05.06.24.
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
                print("Network error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            guard let response = response as? HTTPURLResponse else {
                print("Wrong response")
                completion(.failure(NetworkError.wrongResponse))
                return
            }

            guard (200...299).contains(response.statusCode) else {
                print("Wrong status code: \(response.statusCode)")
                completion(.failure(NetworkError.wrongStatusCode(code: response.statusCode)))
                return
            }

            guard let data = data else {
                print("No data")
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

