//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Tyler Green on 8/4/23.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    var movie: MovieModel?
    
    private let image = UIImageView()
    private let releaseLabel = UILabel()
    private let runtimeLabel = UILabel()
    private let overviewLabel = UILabel()
    
    
    init(movie: MovieModel?) {
        super.init(nibName: nil, bundle: nil)
        self.movie = movie
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = MovieNetworkService()
        
        self.title = self.movie?.title
        view.backgroundColor = .white
        
        if let backDropPath = self.movie?.backDrop {
            image.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(backDropPath)")!)
        } else {
            image.image = UIImage(named: "")
        }
        
        view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        if let date = self.movie?.releaseDate {
            releaseLabel.text = "  Released: \(date)  "
        }
        
        
        view.addSubview(releaseLabel)
        releaseLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseLabel.backgroundColor = .black
        releaseLabel.layer.masksToBounds = true
        releaseLabel.layer.cornerRadius = 8
        releaseLabel.textColor = .white
        NSLayoutConstraint.activate([
            releaseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            releaseLabel.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -20)
        ])
        
        overviewLabel.text = self.movie?.overview
        
        view.addSubview(overviewLabel)
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.textAlignment = .justified
        overviewLabel.font = .systemFont(ofSize: 18)
        overviewLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            overviewLabel.topAnchor.constraint(equalTo: releaseLabel.bottomAnchor, constant: 16)
        ])
        
        Task {
            let movieDetails = await service.getMovieDetails(movieId: self.movie!.id)
            print(movieDetails!)
            
            runtimeLabel.text = "  \(movieDetails?.runtime ?? 0) min  "
            
            view.addSubview(runtimeLabel)
            runtimeLabel.translatesAutoresizingMaskIntoConstraints = false
            runtimeLabel.backgroundColor = .black
            runtimeLabel.layer.masksToBounds = true
            runtimeLabel.layer.cornerRadius = 8
            runtimeLabel.textColor = .white
            runtimeLabel.font = .systemFont(ofSize: 18)
            runtimeLabel.numberOfLines = 0
            NSLayoutConstraint.activate([
                runtimeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                runtimeLabel.centerYAnchor.constraint(equalTo: releaseLabel.centerYAnchor)
            ])
        }
    
    }
}
