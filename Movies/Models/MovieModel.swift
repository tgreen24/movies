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

struct MovieModel: Codable {
    let id: Int
    let title: String
}
