//
//  MovieCollectionViewCell.swift
//  StarkMovies
//
//  Created by Usr_Prime on 19/07/22.
//

import UIKit
import SDWebImage

class MovieCollectionViewCell: UICollectionViewCell {
    static let identifier = "MovieCollectionViewCell"
    
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
    
    private lazy var movieNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Movie name"
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        layer.cornerRadius = 20
        backgroundColor = Colors.whiteCell

        addSubview(postMovieImageView)
        addSubview(movieNameLabel)
    }
    
    private func setupConstraints() {
        postMovieImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        postMovieImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        postMovieImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        postMovieImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
        
        movieNameLabel.topAnchor.constraint(equalTo: postMovieImageView.bottomAnchor).isActive = true
        movieNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6).isActive = true
        movieNameLabel.widthAnchor.constraint(equalToConstant: frame.width/1.1).isActive = true
    }
    
    func configureCell(name: String, post: String) {
        postMovieImageView.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(post)"),
                                       completed: nil)
        movieNameLabel.text = name
    }
}
