//
//  MovieModel.swift
//  Movies
//
//  Created by Tyler Green on 5/12/23.
//

import Foundation

struct MovieModel: Codable {
    let id: Int
    var title: String
    
    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}
