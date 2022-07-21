//
//  MovieNotFoundTableViewCell.swift
//  StarkMovies
//
//  Created by Usr_Prime on 20/07/22.
//

import UIKit

class MovieNotFoundTableViewCell: UITableViewCell {

    static var identifier = "MovieNotFoundTableViewCell"
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "exclamationmark.circle")
        imageView.tintColor = UIColor.darkGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Movie not found"
        label.textColor = UIColor.darkGray
        label.numberOfLines = 2
        label.font = label.font.withSize(contentView.frame.width/10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(iconImageView)
        addSubview(messageLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        messageLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10).isActive = true
    }
}
