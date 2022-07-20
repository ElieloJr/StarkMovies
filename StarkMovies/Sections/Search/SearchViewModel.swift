//
//  SearchViewModel.swift
//  StarkMovies
//
//  Created by Usr_Prime on 20/07/22.
//

import Foundation

protocol SearchViewDelegate: AnyObject {
    func reloadData()
}

class SearchViewModel {
    var delegate: SearchViewDelegate?
    var movieList: [Movie] = []
    
    func getMovies() {
        TrendingAPI.shared.getTrendingMovies { result in
            switch result {
            case .success(let movies):
                self.movieList += movies
                self.delegate?.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func searchMovie(with query: String) {
        SearchAPI.shared.search(with: query) { result in
            switch result {
            case .success(let movies):
                <#code#>
            case .failure(let error):
                print(error)
                
            }
        }
    }
}
