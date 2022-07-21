//
//  StarkKit.swift
//  StarkMovies
//
//  Created by Usr_Prime on 21/07/22.
//

import UIKit

class StarkKit {
    
    static func defaultPostImageView() -> UIImageView {
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
    }
    
    static func defaultColorfulView(color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    static func defaultStaticLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .darkGray
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func defaultInfoLabel(text: String, size: CGFloat, lines: Int) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.numberOfLines = lines
        label.font = UIFont(name: "Avenir Heavy", size: size)
        label.font = UIFont.boldSystemFont(ofSize: size)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func callViewController(_ viewController: DetailsViewController, with data: Movie) -> UINavigationController {
        let detailsController = viewController
        detailsController.configureScreen(with: data)
        
        let rootController = UINavigationController(rootViewController: detailsController)
        rootController.modalPresentationStyle = .fullScreen
        return rootController
    }
}
