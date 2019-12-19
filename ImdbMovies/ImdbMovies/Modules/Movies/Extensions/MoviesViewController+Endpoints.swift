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
        GetMovies.loadList(page, completion: { [weak self] result in
            guard let strongSelf = self else {
              return
            }
            
            strongSelf.handleLoadedResult(result)
        })
    }
    
    
    /// ---> Function for processing a received result  <--- ///
    func handleLoadedResult(_ result: AnyObject) {
        if result is [MovieObject] {
            if let movies = result as? [MovieObject] {
                dataArray            = movies
                originalDataArray    = movies

                moviesView.reloadData()
            } else {
                AlertPresenter.showAlert(self, message: "You received empty data.")
            }
        } else if result is String {
            AlertPresenter.showAlert(self, message: result as! String)
        }
    }
}
