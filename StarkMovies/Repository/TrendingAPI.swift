//
//  TrendingAPI.swift
//  StarkMovies
//
//  Created by Usr_Prime on 20/07/22.
//

import Foundation

class TrendingAPI {
    
    static let shared = TrendingAPI()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Api.baseURL)/3/trending/movie/day?api_key=\(Api.API_KEY)") else { return }
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
