//
//  SearchResultsViewController.swift
//  StarkMovies
//
//  Created by Usr_Prime on 19/07/22.
//

import UIKit

class SearchResultsViewController: StarkViewController {

    private var resultsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorColor = .clear
        tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: ResultTableViewCell.identifier)
        tableView.register(MovieNotFoundTableViewCell.self, forCellReuseIdentifier: MovieNotFoundTableViewCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    let viewModel = SearchResultsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        
        view.addSubview(resultsTableView)
    }
    
    private func setupConstraints() {
        resultsTableView.frame = view.bounds
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.resultsTableView.reloadData()
        }
    }
}

extension SearchResultsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/3.5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        present(StarkKit.callViewController(DetailsViewController(),
                                            with: viewModel.movies[indexPath.row]), animated: true)
    }
}

extension SearchResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.movies.count == 0 {
            return 1
        } else {
            return viewModel.movies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.movies.count == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieNotFoundTableViewCell.identifier, for: indexPath) as? MovieNotFoundTableViewCell else { return UITableViewCell() }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.identifier, for: indexPath) as? ResultTableViewCell else { return UITableViewCell() }
            cell.configureCell(with: viewModel.movies[indexPath.row])
            return cell
        }
    }
}
