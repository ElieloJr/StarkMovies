//
//  HomeViewModel.swift
//  StarkMovies
//
//  Created by Usr_Prime on 19/07/22.
//

import Foundation

protocol HomeViewDelegate: AnyObject {
    func reloadData()
}

class HomeViewModel {
    var delegate: HomeViewDelegate?
    var movieList: [Movie] = []
    
    func getPopularMovies() {
        PopularAPI.shared.getPopularMovies { result in
            switch result {
            case .success(let movies):
                self.movieList += movies
                self.delegate?.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
