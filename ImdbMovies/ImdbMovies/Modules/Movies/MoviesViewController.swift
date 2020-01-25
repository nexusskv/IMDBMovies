//
//  MoviesViewController.swift
//  ImdbMovies
//
//  Created by Rost on 17.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class MoviesViewController: UIViewController {
    @IBOutlet weak var moviesView: UICollectionView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var sortView: SortView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var viewModel: MoviesViewModel!
    var sortManager: SortManager!
    var searchManager: SearchManager!
    var endpointsManager: EndpointsManager!
    var dataArray: [MovieObject] = []
    var originalDataArray: [MovieObject] = []    
    var currentPage = 1
    var searchPage  = 1
    var cellMargin: CGFloat = 0.0
    var isDataLoading: Bool = false
            
    /// ---> View life cycle  <--- ///
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel           = MoviesViewModel()
        sortManager         = SortManager()
        searchManager       = SearchManager()
        endpointsManager    =  EndpointsManager()
        
        viewModel.setupUI(self)
        
        endpointsManager.loadMovies(self, page: currentPage)
    }
}
