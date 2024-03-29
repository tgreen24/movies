//
//  MovieModel.swift
//  Movies
//
//  Created by Tyler Green on 5/12/23.
//

import Foundation

struct SearchResults: Codable {
    let results: [MovieModel]
}

struct MovieModel: Codable, Hashable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let backDrop: String?
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case backDrop = "backdrop_path"
        case releaseDate = "release_date"
    }
}
