//
//  MainViewController.swift
//  CFMovies
//
//  Created by @thekalko on 2020. 04. 10..
//  Copyright © 2020. thekalko. All rights reserved.
//

import Foundation
import UIKit

struct MovieCategory {
    var name: String = ""
    var movies: [Movie]?
}

struct Movie {
    var name: String = ""
    var size: CGSize = CGSize(width: 0, height: 0)
}

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let refreshControll: UIRefreshControl = {
        let rc = UIRefreshControl()
        rc.attributedTitle = NSAttributedString(string: "Pull to refresh")
        rc.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        return rc
    }()
    
    let tableCellId: String = "categoryTableCell"
    
    var Movies: [MovieCategory] = [MovieCategory(name: "First category", movies: [
        Movie(name: "Film #1", size: CGSize(width: 100, height: 100)),
        Movie(name: "Film #2",size: CGSize(width: 200, height: 100)),
        Movie(name: "Film #3",size: CGSize(width: 100, height: 100)),
        Movie(name: "Film #4", size: CGSize(width: 100, height: 100)),
        Movie(name: "Film #4", size: CGSize(width: 100, height: 100)),
        Movie(name: "Film #5", size: CGSize(width: 100, height: 100)),
        Movie(name: "Film #6", size: CGSize(width: 100, height: 100))
        ])
    ]
    
    let tableView: UITableView = {
       let tw = UITableView()
        tw.translatesAutoresizingMaskIntoConstraints = false
       return tw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        //tableView.delegate = self
        tableView.dataSource = self
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.refreshControl = refreshControll
        
        tableView.register(MoviesCategoryTableCell.self, forCellReuseIdentifier: tableCellId)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellId, for: indexPath) as! MoviesCategoryTableCell
        cell.movies = Movies[indexPath.row].movies
        cell.categoryName = Movies[indexPath.row].name
        cell.minHeight = 100
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @objc func refresh(sender:AnyObject) {
        if var movies = Movies[0].movies {
            movies.append(Movie(name: "Nyolcadik movie", size: CGSize(width: 100, height: 200)))
            Movies[0].movies = movies
        }
        tableView.reloadData()
        refreshControll.endRefreshing()
    }
}
