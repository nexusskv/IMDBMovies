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
    func handleSearch(_ bar: UISearchBar) {
        if let query = bar.text, query.count > 2 {
            endSearch(bar)
            
            currentPage = 1
            dataArray   = []
            
            DataContainer.shared.searchQuery = query
            
            loadSearch(query, page: searchPage)

            if DataContainer.shared.selectedSortType != .none {
                sortMovies(DataContainer.shared.selectedSortType)
            }
        } else {
            AlertPresenter.showAlert(self, message: "Please enter a title of movie for search.")
            restoreAllMovies()
        }
    }
    
    
    /// ---> Function for processing a search cancel button  <--- ///
    func handleSearchCancel(_ bar: UISearchBar) {
        bar.text = nil
        
        endSearch(bar)
        
        searchPage                          = 1
        DataContainer.shared.searchQuery    = nil
        
        restoreAllMovies()
    }
    
    
    /// ---> Function for processing a search text  <--- ///
    func handleSearchText(_ text: String, at bar: UISearchBar) {
        if text.isEmpty {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.endSearch(bar)
            }
        }
    }
    
    
    /// ---> Function for close search  <--- ///
    func endSearch(_ bar: UISearchBar) {
        view.endEditing(true)
        bar.showsCancelButton = false
    }
}
