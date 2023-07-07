//
//  ViewController.swift
//  Movies
//
//  Created by Tyler Green on 4/28/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    private var tableView = UITableView()
    private var dataSource: MovieTableViewDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let service = MovieNetworkService()
        
        dataSource = MovieTableViewDataSource(tableView: tableView)
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        Task {
            let movies = await service.searchMovies(query: "marvel", page: 1)
            print(movies)
            dataSource?.loadWithItems(movies)
        }
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


}

