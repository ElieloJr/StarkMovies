//
//  PopularAPI.swift
//  StarkMovies
//
//  Created by Usr_Prime on 19/07/22.
//

import Foundation

class PopularAPI {
    let baseURL = "https://api.themoviedb.org"
    let API_KEY = "9d688d41b74665766f4eb69424c574fa"
    
    static let shared = PopularAPI()
    
    func getPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/3/movie/popular?api_key=\(API_KEY)&language=en-US&page=1")
        else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let results = try JSONDecoder().decode(PopularAPIResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }; task.resume()
    }
}

