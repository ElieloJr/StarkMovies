//
//  SearchViewModel.swift
//  StarkMovies
//
//  Created by Usr_Prime on 20/07/22.
//

import UIKit

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
    
    func searchMovie(with query: String, and resultsController: SearchResultsViewController) {
        SearchAPI.shared.search(with: query) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movies):
                    resultsController.viewModel.movies = movies
                    resultsController.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
