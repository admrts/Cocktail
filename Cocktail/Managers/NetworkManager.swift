//
//  NetworkManager.swift
//  Cocktail
//
//  Created by Ali Demirtaş on 29.09.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    let baseUrl = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="
    private init() {}
    
    func getCoctail(for cocktailName: String, completed: @escaping (Result<Cocktail, CTError>) -> Void) {
        let urlString = baseUrl + cocktailName.lowercased()
        
        guard let url = URL(string: urlString) else {
            completed(.failure(.unableToComplete))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let cocktails = try decoder.decode(Cocktail.self, from: data)
                completed(.success(cocktails))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
}
