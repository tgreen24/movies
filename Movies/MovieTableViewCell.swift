//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Tyler Green on 7/7/23.
//

import Foundation
import UIKit

class MovieTableViewCell: UITableViewCell {
    static let reuseIdentifier = String(describing: MovieTableViewCell.self)
    
    private var model: MovieModel?
    
    private let titleLabel = UILabel()
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with model: MovieModel) {
        self.model = model
        
        titleLabel.text = model.title
        
        setupUI()
    }
}
