//
//  MovieCell.swift
//  CFMovies
//
//  Created by @thekalko on 2020. 04. 11..
//  Copyright © 2020. thekalko. All rights reserved.
//

import Foundation
import UIKit

class MovieCell: UICollectionViewCell {
    
     let name: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
     }()
    
    var movieName: String? {
        didSet {
            if let movieName = movieName {
                name.text = movieName
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        
        name.addSubview(self)
        name.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        name.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        name.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        name.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
