//
//  NetworkManager.swift
//  Rick&Morty_TestTask
//
//  Created by Поляндий on 11.11.2022.
//

import Foundation

class NetworkManager {
    static let network = NetworkManager()
    
    let characterURL = URL(string: "https://rickandmortyapi.com/api/character/?name=rick&species=human")

    func getCharacters(completion: @escaping (Result<[Characters], Error>) -> Void) {
        guard let url = characterURL else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error{
                completion(.failure(error))
                print("Ошибка: \(error.localizedDescription)")
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Characters: \(result.results.count)")
                    completion(.success(result.results))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
