//
//  HeaderCollectionReusableView.swift
//  StarkMovies
//
//  Created by Usr_Prime on 19/07/22.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionReusableView"
    
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
    
    private lazy var starkLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Stark".uppercased()
        label.font = UIFont(name: "Al Nile Bold", size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var moviesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Movies".uppercased()
        label.font = UIFont(name: "Khmer Sangam MN", size: 34)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 3
        label.text = "O melhor do entretenimento na palma da sua mão"
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
        addSubview(lightBlueView)
        addSubview(darkBlueView)
        
        addSubview(starkLabel)
        addSubview(moviesLabel)
        addSubview(messageLabel)
    }
    
    private func setupConstraints() {
        lightBlueView.topAnchor.constraint(equalTo: topAnchor, constant: -100).isActive = true
        lightBlueView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        lightBlueView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        lightBlueView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        darkBlueView.topAnchor.constraint(equalTo: topAnchor, constant: -100).isActive = true
        darkBlueView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        darkBlueView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        darkBlueView.heightAnchor.constraint(equalToConstant: 330).isActive = true
        
        starkLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        starkLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        moviesLabel.centerYAnchor.constraint(equalTo: starkLabel.centerYAnchor, constant: -2).isActive = true
        moviesLabel.leadingAnchor.constraint(equalTo: starkLabel.trailingAnchor, constant: 3).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: starkLabel.bottomAnchor, constant: -2).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: starkLabel.leadingAnchor).isActive = true
        messageLabel.widthAnchor.constraint(equalToConstant: frame.width/1.1).isActive = true
    }
}
