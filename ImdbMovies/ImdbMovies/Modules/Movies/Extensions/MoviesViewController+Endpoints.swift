//
//  MoviesViewController+Endpoints.swift
//  ImdbMovies
//
//  Created by Rost on 17.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MoviesViewController {
    
    /// ---> Function for download data source from server API <--- ///
    func loadMovies(_ page: Int) {
        activityIndicator.startAnimating()
        
        GetMovies.loadList(page, completion: { [weak self] result in
            guard let strongSelf = self else {
              return
            }
            
            strongSelf.handleLoadedResult(result, type: .movies)
        })
    }

    
    /// ---> Function for download movies by search query from server API <--- ///
    func loadSearch(_ query: String, page: Int) {
        activityIndicator.startAnimating()
        
        GetSearch.loadSearch(query, page: page, completion: { [weak self] result in
            guard let strongSelf = self else {
              return
            }
            
            strongSelf.handleLoadedResult(result, type: .search)
        })
    }
    
    
    /// ---> Function for processing a received result  <--- ///
    func handleLoadedResult(_ result: AnyObject, type: EndpointsTypes) {
        if result is [MovieObject] {
            if let movies = result as? [MovieObject] {
                if type == .movies {
                    dataArray            += movies
                    originalDataArray    += movies
                    
                } else if type == .search {
                    dataArray            += movies
                }
                
                moviesView.reloadData()
            } else {
                AlertPresenter.showAlert(self, message: "You received empty data.")
            }
        } else if result is String {
            AlertPresenter.showAlert(self, message: result as! String)
        }
        
        isDataLoading = false
        activityIndicator.stopAnimating()
    }
}
