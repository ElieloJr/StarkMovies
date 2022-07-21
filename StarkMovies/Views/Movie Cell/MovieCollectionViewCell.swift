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
    
    private lazy var postMovieImageView: UIImageView = StarkKit.defaultPostImageView()
    
    private lazy var movieNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Movie name"
        label.textColor = .black
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
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
        postMovieImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
        
        movieNameLabel.topAnchor.constraint(equalTo: postMovieImageView.bottomAnchor).isActive = true
        movieNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        movieNameLabel.widthAnchor.constraint(equalToConstant: frame.width/1.1).isActive = true
    }
    
    func configureCell(name: String, post: String) {
        postMovieImageView.sd_setImage(with: URL(string: "\(Api.baseURLImage)\(post)"),
                                       completed: nil)
        postMovieImageView.contentMode = .scaleAspectFill
        movieNameLabel.text = name
    }
}
