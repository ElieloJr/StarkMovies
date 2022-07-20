//
//  SearchAPI.swift
//  StarkMovies
//
//  Created by Usr_Prime on 20/07/22.
//

import Foundation

class SearchAPI {
    
    static let shared = SearchAPI()
    
    func search(with query: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(Api.baseURL)/3/search/movie?api_key=\(Api.API_KEY)&query=\(query)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let results = try JSONDecoder().decode(PopularAPIResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
