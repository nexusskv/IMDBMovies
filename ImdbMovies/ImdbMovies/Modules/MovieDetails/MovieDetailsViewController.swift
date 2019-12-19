//
//  MovieDetailsViewController.swift
//  ImdbMovies
//
//  Created by Rost on 17.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var detailsTable: UITableView!
    var detailsObject: MovieDetailsObject!
    var cellTypes = [DetailsTableCells]()
            
    /// ---> View life cycle  <--- ///
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadMovieDetails()
    }
}
