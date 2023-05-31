//
//  NetworkService.swift
//  Movies
//
//  Created by Tyler Green on 5/26/23.
//

import Foundation


class MovieNetworkService {
    let baseUrl = "https://api.themoviedb.org"
    let searchUrl = "/3/search/movie"
    let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    
    let headers = [
      "accept": "application/json"
    ]
    
    func searchMovies(query: String, page: Int) async -> [MovieModel] {
        var urlComponents = URLComponents(string: baseUrl)
        urlComponents?.path = searchUrl
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "include_adult", value: "false")
        ]
        
        guard let url = urlComponents?.url else {
            return []
        }
        
        let movies: [MovieModel]
        do {
            let result: (data: Data, response: URLResponse) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(SearchResults.self, from: result.data)
            movies = decoded.results
        } catch {
            print(error)
            movies = []
        }
        return movies
    }
}
