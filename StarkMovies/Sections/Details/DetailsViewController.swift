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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        view.addSubview(lightBlueView)
        view.addSubview(darkBlueView)
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
    }
    
    @objc func backButton() {
        dismiss(animated: true, completion: nil)
    }
}
