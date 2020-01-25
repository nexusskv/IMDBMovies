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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var detailsObject: MovieDetailsObject!
    var cellTypes = [DetailsTableCells]()    
    var viewModel: DetailsViewModel!
    var endpointsManager: DetailsEndpointsManager!
    
    /// ---> View life cycle  <--- ///
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel           = DetailsViewModel()
        endpointsManager    = DetailsEndpointsManager()
        
        viewModel.setupUI(self)
    }

    
    /// ---> View life cycle  <--- ///
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        endpointsManager.loadMovieDetails(self)
    }
}
