//
//  ViewController.swift
//  Movies
//
//  Created by Tyler Green on 4/28/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let service = MovieNetworkService()
        Task {
            let movies = await service.searchMovies(query: "marvel", page: 1)
            print(movies)
        }
    }


}

