//
//  MoviesViewController+Search.swift
//  ImdbMovies
//
//  Created by Rost on 17.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MoviesViewController {
    
    /// ---> Function for processing a search string  <--- ///
    func handleSearch(_ value: String) {
        if value.count > 0 {
            dataArray = originalDataArray.filter({ (movie) -> Bool in
                let title: NSString = movie.movieTitle as NSString
                let titleRange = title.range(of: value, options: .caseInsensitive)
                
                return titleRange.location != NSNotFound
            })

            if DataContainer.shared.selectedSortType != .none {
                sortMovies(DataContainer.shared.selectedSortType)
            }
        } else {
            restoreAllMovies()
        }

        moviesView.reloadData()
    }
    
    
    /// ---> Function for processing a search cancel button  <--- ///
    func handleSearchCancel(_ bar: UISearchBar) {
        bar.text = nil
        bar.resignFirstResponder()
        
        restoreAllMovies()
    }
}
