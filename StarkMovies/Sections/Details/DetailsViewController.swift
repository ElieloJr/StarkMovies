//
//  DetailsViewController.swift
//  StarkMovies
//
//  Created by Usr_Prime on 20/07/22.
//

import UIKit

class DetailsViewController: StarkViewController {
    
    lazy var leftButton: UIButton = {
        let leftButton: UIButton = UIButton()
        leftButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        leftButton.tintColor = .white
        leftButton.contentVerticalAlignment = .fill
        leftButton.contentHorizontalAlignment = .fill
        leftButton.addTarget(self, action: #selector(backButton), for: .touchUpInside)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftButton.widthAnchor.constraint(equalToConstant: 35),
            leftButton.heightAnchor.constraint(equalToConstant: (((navigationController?.navigationBar.frame.height)!)/2)*1.3)
        ])
        return leftButton
    }()
    
    private lazy var lightBlueView: UIView = StarkKit.defaultColorfulView(color: Colors.lightBlueView)
    private lazy var darkBlueView: UIView = StarkKit.defaultColorfulView(color: Colors.darkBlueView)
    
    private lazy var postMovieImageView: UIImageView = StarkKit.defaultPostImageView()
    
    private lazy var movieNameStaticLabel: UILabel = StarkKit.defaultStaticLabel(text: "Movie Name:")
    private lazy var movieNameLabel: UILabel = StarkKit.defaultInfoLabel(text: "...",
                                                                         size: 22.0,
                                                                         lines: 2)
    
    private lazy var launchInStaticLabel: UILabel = StarkKit.defaultStaticLabel(text: "Launch in:")
    private lazy var dateLabel: UILabel = StarkKit.defaultInfoLabel(text: "0000-00-00",
                                                                    size: 20.0,
                                                                    lines: 2)
    
    private lazy var overviewStaticLabel: UILabel = StarkKit.defaultStaticLabel(text: "Overview:")
    private lazy var overviewLabel: UILabel = StarkKit.defaultInfoLabel(text: "...",
                                                                        size: 18.0,
                                                                        lines: 20)
    
    private lazy var detailsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        
        scrollView.addSubview(lightBlueView)
        scrollView.addSubview(darkBlueView)

        scrollView.addSubview(postMovieImageView)

        scrollView.addSubview(movieNameStaticLabel)
        scrollView.addSubview(movieNameLabel)

        scrollView.addSubview(launchInStaticLabel)
        scrollView.addSubview(dateLabel)

        scrollView.addSubview(overviewStaticLabel)
        scrollView.addSubview(overviewLabel)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = true
        
        lightBlueView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -100).isActive = true
        lightBlueView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        lightBlueView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        lightBlueView.heightAnchor.constraint(equalToConstant: 350).isActive = true

        darkBlueView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -100).isActive = true
        darkBlueView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        darkBlueView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        darkBlueView.heightAnchor.constraint(equalToConstant: 330).isActive = true

        postMovieImageView.topAnchor.constraint(equalTo: darkBlueView.centerYAnchor, constant: -30).isActive = true
        postMovieImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        postMovieImageView.widthAnchor.constraint(equalToConstant: view.frame.width/1.7).isActive = true
        postMovieImageView.heightAnchor.constraint(equalToConstant: view.frame.width/1.2).isActive = true

        movieNameStaticLabel.topAnchor.constraint(equalTo: postMovieImageView.bottomAnchor, constant: 14).isActive = true
        movieNameStaticLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true

        movieNameLabel.topAnchor.constraint(equalTo: movieNameStaticLabel.bottomAnchor, constant: 2).isActive = true
        movieNameLabel.leadingAnchor.constraint(equalTo: movieNameStaticLabel.leadingAnchor, constant: 6).isActive = true
        movieNameLabel.widthAnchor.constraint(equalToConstant: view.frame.width/1.1).isActive = true

        launchInStaticLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 10).isActive = true
        launchInStaticLabel.leadingAnchor.constraint(equalTo: movieNameStaticLabel.leadingAnchor).isActive = true

        dateLabel.topAnchor.constraint(equalTo: launchInStaticLabel.bottomAnchor, constant: 2).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: movieNameLabel.leadingAnchor).isActive = true

        overviewStaticLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10).isActive = true
        overviewStaticLabel.leadingAnchor.constraint(equalTo: movieNameStaticLabel.leadingAnchor).isActive = true

        overviewLabel.topAnchor.constraint(equalTo: overviewStaticLabel.bottomAnchor, constant: 2).isActive = true
        overviewLabel.leadingAnchor.constraint(equalTo: movieNameLabel.leadingAnchor).isActive = true
        overviewLabel.widthAnchor.constraint(equalToConstant: view.frame.width/1.1).isActive = true
        overviewLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20).isActive = true
        
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        view.addSubview(detailsScrollView)
    }
    
    private func setupConstraints() {
        detailsScrollView.frame = view.bounds
    }
    
    @objc func backButton() {
        dismiss(animated: true, completion: nil)
    }
    
    func configureScreen(with movie: Movie) {
        if let post = movie.poster_path, let name = movie.original_title,
           let date = movie.release_date, let overview = movie.overview {
            postMovieImageView.sd_setImage(with: URL(string: "\(Api.baseURLImage)\(post)"), completed: nil)
            postMovieImageView.contentMode = .scaleAspectFill
            movieNameLabel.text = name
            dateLabel.text = date
            overviewLabel.text = overview
        }
    }
}
