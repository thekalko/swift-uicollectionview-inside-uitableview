//
//  MoviesCategoryTableCell.swift
//  CFMovies
//
//  Created by @thekalko on 2020. 04. 11..
//  Copyright © 2020. thekalko. All rights reserved.
//

import Foundation
import UIKit

class MoviesCategoryTableCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var minHeight: CGFloat?
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cw = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        cw.showsVerticalScrollIndicator = false
        cw.showsHorizontalScrollIndicator = false
        cw.translatesAutoresizingMaskIntoConstraints = false
        return cw
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var categoryName: String? {
        didSet {
            guard let categoryName = categoryName else {return}
            name.text = categoryName
        }
    }
    
    var movies: [Movie]? {
        didSet {
            collectionView.collectionViewLayout.invalidateLayout()
            collectionView.reloadData()
        }
    }
    
    let cellId: String = "movieCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(name)
        name.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        name.heightAnchor.constraint(equalToConstant: 25).isActive = true
        name.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        name.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        
        self.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        
        collectionView.delegate = self
        collectionView.backgroundColor = .gray
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MovieCell
        
        if let movies = movies {
            cell.movieName = movies[indexPath.row].name
        }
             
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let movies = movies {
            return movies[indexPath.row].size
        }
        
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        let size = super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
        guard let minHeight = minHeight else { return size }
        return CGSize(width: size.width, height: max(size.height, minHeight))
    }
    
}
