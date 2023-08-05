//
//  MovieDetailModel.swift
//  Movies
//
//  Created by Tyler Green on 8/4/23.
//

import Foundation

struct MovieDetailModel: Codable, Hashable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let backDrop: String?
    let releaseDate: String
    let budget: Int
    let homepage: String
    let revenue: Int
    let runtime: Int
    let status: String
    let tagline: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case backDrop = "backdrop_path"
        case releaseDate = "release_date"
        case budget
        case homepage
        case revenue
        case runtime
        case status
        case tagline
    }
}
