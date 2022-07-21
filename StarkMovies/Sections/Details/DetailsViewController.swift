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
    
    private lazy var lightBlueView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.lightBlueView
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var darkBlueView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.darkBlueView
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var postMovieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = Colors.greyIconNotFond
        imageView.image = UIImage(systemName: "xmark.icloud")
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var movieNameStaticLabel: UILabel = {
        let label = UILabel()
        label.text = "Movie Name:"
        label.textColor = .darkGray
        label.numberOfLines = 2
//        label.font = UIFont(name: "Avenir Heavy", size: 14)
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var movieNameLabel: UILabel = {
        let label = UILabel()
        label.text = "La Cuca Ratcha"
        label.textColor = .black
        label.numberOfLines = 2
        label.font = UIFont(name: "Avenir Heavy", size: 22)
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        view.addSubview(lightBlueView)
        view.addSubview(darkBlueView)
        view.addSubview(postMovieImageView)
        view.addSubview(movieNameStaticLabel)
        view.addSubview(movieNameLabel)
    }
    
    private func setupConstraints() {
        lightBlueView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        lightBlueView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        lightBlueView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        lightBlueView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        darkBlueView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        darkBlueView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        darkBlueView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        darkBlueView.heightAnchor.constraint(equalToConstant: 330).isActive = true
        
        postMovieImageView.topAnchor.constraint(equalTo: darkBlueView.centerYAnchor, constant: -40).isActive = true
        postMovieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        postMovieImageView.widthAnchor.constraint(equalToConstant: view.frame.width/1.7).isActive = true
        postMovieImageView.heightAnchor.constraint(equalToConstant: view.frame.width/1.2).isActive = true
        
        movieNameStaticLabel.topAnchor.constraint(equalTo: postMovieImageView.bottomAnchor, constant: 14).isActive = true
        movieNameStaticLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
        movieNameLabel.topAnchor.constraint(equalTo: movieNameStaticLabel.bottomAnchor, constant: 2).isActive = true
        movieNameLabel.leadingAnchor.constraint(equalTo: movieNameStaticLabel.leadingAnchor, constant: 6).isActive = true
    }
    
    @objc func backButton() {
        dismiss(animated: true, completion: nil)
    }
}
