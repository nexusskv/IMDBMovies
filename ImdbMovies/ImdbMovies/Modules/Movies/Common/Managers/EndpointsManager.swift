//
//  EndpointsManager.swift
//  ImdbMovies
//
//  Created by Rost on 24.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class EndpointsManager {
    
    /// ---> Function for download data source from server API <--- ///
    func loadMovies(_ view: MoviesViewController, page: Int) {
        view.activityIndicator.startAnimating()
        
        GetMovies.loadList(page, completion: { [weak self] result in
            guard let strongSelf = self else {
              return
            }
            
            strongSelf.handleLoadedResult(view, result: result, type: .movies)
        })
    }

    
    /// ---> Function for download movies by search query from server API <--- ///
    func loadSearch(_ view: MoviesViewController, query: String, page: Int) {
        view.activityIndicator.startAnimating()
        
        GetSearch.loadSearch(query, page: page, completion: { [weak self] result in
            guard let strongSelf = self else {
              return
            }
            
            strongSelf.handleLoadedResult(view, result: result, type: .search)
        })
    }
    
    
    /// ---> Function for processing a received result  <--- ///
    func handleLoadedResult(_ view: MoviesViewController, result: AnyObject, type: EndpointsTypes) {
        if result is [MovieObject] {
            if let movies = result as? [MovieObject] {
                if type == .movies {
                    view.dataArray            += movies
                    view.originalDataArray    += movies
                    
                } else if type == .search {
                    view.dataArray            += movies
                }
                
                view.moviesView.reloadData()
            } else {
                AlertPresenter.showAlert(view, message: "You received empty data.")
            }
        } else if result is String {
            AlertPresenter.showAlert(view, message: result as! String)
        }
        
        view.isDataLoading = false
        view.activityIndicator.stopAnimating()
    }
}
