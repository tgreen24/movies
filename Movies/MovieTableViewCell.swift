//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Tyler Green on 7/7/23.
//

import Foundation
import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    static let reuseIdentifier = String(describing: MovieTableViewCell.self)
    
    private var model: MovieModel?
    
    private let titleLabel = UILabel()
    private let image = UIImageView()
    
    private func setupUI() {
        
        contentView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            image.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            titleLabel.centerYAnchor.constraint(equalTo: image.centerYAnchor)
        ])
    }
    
    func configure(with model: MovieModel) {
        self.model = model
        
        titleLabel.text = model.title
        if let posterPath = model.posterPath {
            image.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath)")!)
        }
        
        setupUI()
    }
}
