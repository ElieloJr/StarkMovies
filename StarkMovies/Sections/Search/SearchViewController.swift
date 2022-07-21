//
//  SearchViewController.swift
//  StarkMovies
//
//  Created by Usr_Prime on 19/07/22.
//

import UIKit

class SearchViewController: StarkViewController {
    
    private let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: SearchResultsViewController())
        controller.searchBar.placeholder = "Search for a Movie"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    
    private var recommendedTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorColor = .clear
        tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: ResultTableViewCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    let viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        viewModel.getMovies()
    }
    
    private func setupView() {
        searchController.searchResultsUpdater = self
        recommendedTableView.delegate = self
        recommendedTableView.dataSource = self
        
        title = "Search"
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(recommendedTableView)
    }
    
    private func setupConstraints() {
        recommendedTableView.frame = view.bounds
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/3.5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsController = DetailsViewController()
        detailsController.navigationItem.title = navigationItem.title
        detailsController.configureScreen(with: viewModel.movieList[indexPath.row])
        
        let rootController = UINavigationController(rootViewController: detailsController)
        rootController.modalPresentationStyle = .fullScreen
        present(rootController, animated: true)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.identifier, for: indexPath) as? ResultTableViewCell else { return UITableViewCell() }
        cell.configureCell(with: viewModel.movieList[indexPath.row])
        return cell
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
        guard let query = searchBar.text,
                !query.trimmingCharacters(in: .whitespaces).isEmpty,
                query.trimmingCharacters(in: .whitespaces).count >= 2,
        let resultsController = searchController.searchResultsController as? SearchResultsViewController else { return }
        self.viewModel.searchMovie(with: query, and: resultsController)
    }
}

extension SearchViewController: SearchViewDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.recommendedTableView.reloadData()
        }
    }
}
