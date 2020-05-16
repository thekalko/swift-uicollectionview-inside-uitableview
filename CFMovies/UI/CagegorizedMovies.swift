//
//  CagegorizedMovies.swift
//  CFMovies
//
//  Created by @thekalko on 2020. 04. 11..
//  Copyright © 2020. thekalko. All rights reserved.
//

import Foundation
import UIKit

struct MoviCategory {
    var CategoryName = ""
}

struct Movie {
    var Name = ""
}

class CategorizedMovies: UITableView, UITableViewDelegate {
    
    override init(frame: CGRect, style: UITableView.Style) {
        supert.init(frame: frame, style: style)
    }
    
    let movies: [Movie]
    
    override func numberOfRows(inSection section: Int) -> Int {
        return 3
    }
    
}
