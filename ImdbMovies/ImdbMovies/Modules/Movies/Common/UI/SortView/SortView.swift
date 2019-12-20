//
//  SortView.swift
//  ImdbMovies
//
//  Created by Rost on 18.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class SortView: UIView {
    @IBOutlet weak var sortTable: UITableView!
    var titlesArray: [String] = []
    var currentSort: MoviesSortTypes = .none
    
    /// ---> View life cycle <--- ///
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

}
