//
//  MovieTableViewDataSource.swift
//  Movies
//
//  Created by Tyler Green on 7/7/23.
//

import Foundation
import UIKit

class MovieTableViewDataSource: UITableViewDiffableDataSource<Int, MovieModel> {
    
    convenience init(tableView: UITableView) {
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.reuseIdentifier)
        
        self.init(tableView: tableView, cellProvider: { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.reuseIdentifier,
            for: indexPath) as? MovieTableViewCell
            
            cell?.configure(with: item)
            cell?.selectionStyle = .none
            return cell
        })
    }
    
    func loadWithItems(_ items: [MovieModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, MovieModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(items, toSection: 0)
        snapshot.reloadItems(items)
        apply(snapshot, animatingDifferences: false)
    }
}
