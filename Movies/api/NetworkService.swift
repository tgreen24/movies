//
//  NetworkService.swift
//  Movies
//
//  Created by Tyler Green on 5/26/23.
//

import Foundation


class MovieNetworkService {
    let baseUrl: String = "https://api.themoviedb.org"
    
    let headers = [
      "accept": "application/json"
    ]

    
    func searchMovies(completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) {
        guard let url = URL(string: baseUrl + "3/search/movie?api_key=eb5d9998400f4c57683e468514e7019c") else {
            return
        }
        let request = NSMutableURLRequest(url: NSURL(string: baseUrl + "3/movie/now_playing?language=en-US&page=1?api_key=eb5d9998400f4c57683e468514e7019c")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: completionHandler)
        dataTask.resume()
    }
}
