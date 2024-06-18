//
//  NetworkService.swift
//  homework.38
//
//  Created by vano Kvakhadze on 17.06.24.
//

import Foundation

class Networking {

    enum NetworkError: Error, LocalizedError {
        case decodeError
        case wrongResponse
        case wrongStatusCode(code: Int)
        case customError(description: String)
        
        var errorDescription: String? {
            switch self {
            case .decodeError:
                return "Failed to decode the response."
            case .wrongResponse:
                return "Received an invalid response."
            case .wrongStatusCode(let code):
                return "Received an unexpected status code: \(code)."
            case .customError(let description):
                return description
            }
        }
    }
    
    func getData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.customError(description: "Invalid URL")))
            return
        }

        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                print("URLSession error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                print("Failed to cast response as HTTPURLResponse")
                completion(.failure(NetworkError.wrongResponse))
                return
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                print("Unexpected status code: \(httpResponse.statusCode)")
                completion(.failure(NetworkError.wrongStatusCode(code: httpResponse.statusCode)))
                return
            }

            guard let data = data else {
                print("No data received")
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
