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
    
    
    func loadNextPage(_ index: Int) {
        if index >= dataArray.count - 5 {

            if dataArray.count > 0 && isDataLoading == false {
                if let total = DataContainer.shared.totalPages {
                    if currentPage < total {
                        currentPage += 1
                        
                        print(currentPage)
                        isDataLoading = true
                        
                        loadMovies(currentPage)
                    }
                }
            }
        }
    }
    
    
    /// ---> Function for processing a received result  <--- ///
    func handleLoadedResult(_ result: AnyObject) {
        if result is [MovieObject] {
            if let movies = result as? [MovieObject] {
                dataArray            += movies
                originalDataArray    += movies

                moviesView.reloadData()
            } else {
                AlertPresenter.showAlert(self, message: "You received empty data.")
            }
        } else if result is String {
            AlertPresenter.showAlert(self, message: result as! String)
        }
        
        isDataLoading = false
    }
}
