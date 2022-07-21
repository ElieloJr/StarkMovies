//
//  HomeViewController.swift
//  StarkMovies
//
//  Created by Usr_Prime on 19/07/22.
//

import UIKit

class HomeViewController: StarkViewController {

    private lazy var moviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: (view.frame.width/2.2), height: (view.frame.width/1.1))
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.register(MovieCollectionViewCell.self,
                                forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        collectionView.register(HeaderCollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderCollectionReusableView.identifier)
        return collectionView
    }()
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        viewModel.getPopularMovies()
    }
    
    private func setupView() {
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        
        viewModel.delegate = self
        view.addSubview(moviesCollectionView)
    }
    
    private func setupConstraints() {
        moviesCollectionView.frame = view.bounds
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsController = DetailsViewController()
        detailsController.navigationItem.title = navigationItem.title
//        postController.setupScreen(with: viewModel.posts[indexPath.row])
        
        let rootController = UINavigationController(rootViewController: detailsController)
        rootController.modalPresentationStyle = .fullScreen
        present(rootController, animated: true)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movieList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
        
        if let movieName = viewModel.movieList[indexPath.row].original_title,
           let moviePost = viewModel.movieList[indexPath.row].poster_path {
            cell.configureCell(name: movieName, post: moviePost)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
            return headerView
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
         if (indexPath.row == viewModel.movieList.count - 4 ) {
             viewModel.getPopularMovies()
         }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionsView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 280)
    }
}

extension HomeViewController: HomeViewDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.moviesCollectionView.reloadData()
        }
    }
}
