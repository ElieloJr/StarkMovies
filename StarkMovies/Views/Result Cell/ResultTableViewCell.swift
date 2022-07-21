//
//  ResultTableViewCell.swift
//  StarkMovies
//
//  Created by Usr_Prime on 19/07/22.
//

import UIKit
import SDWebImage

class ResultTableViewCell: UITableViewCell {

    static var identifier = "ResultTableViewCell"
    
    private lazy var postMovieImageView: UIImageView = StarkKit.defaultPostImageView()
    
    private lazy var movieNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Movie Name"
        label.textColor = .black
        label.numberOfLines = 2
        label.font = UIFont(name: "Avenir Heavy", size: 22)
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "(date)"
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.text = "Overview of the movie"
        label.textColor = .darkGray
        label.numberOfLines = 4
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(postMovieImageView)
        addSubview(movieNameLabel)
        addSubview(dateLabel)
        addSubview(overviewLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        postMovieImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        postMovieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        postMovieImageView.widthAnchor.constraint(equalToConstant: frame.width/2.5).isActive = true
        postMovieImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        movieNameLabel.topAnchor.constraint(equalTo: postMovieImageView.topAnchor, constant: 10).isActive = true
        movieNameLabel.leadingAnchor.constraint(equalTo: postMovieImageView.trailingAnchor, constant: 10).isActive = true
        movieNameLabel.widthAnchor.constraint(equalToConstant: frame.width/2).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 2).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: movieNameLabel.leadingAnchor).isActive = true
        
        overviewLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 2).isActive = true
        overviewLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor).isActive = true
        overviewLabel.widthAnchor.constraint(equalToConstant: frame.width/2).isActive = true
    }
    
    func configureCell(with movie: Movie) {
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
