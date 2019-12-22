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
    
    /// ---> Fucntions handle tap by search item in the navigation bar <--- ///
    func searchItemHandler() {
        if searchBar.isHidden {
            showSearchBar(true)
        } else {
            showSearchBar(false)
        }
    }
    
    
    /// ---> Function for processing a search string  <--- ///
    func handleSearch(_ bar: UISearchBar) {
        if let query = bar.text, query.count > 2 {
            searchItemHandler()
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
        
        searchPage                          = 1
        DataContainer.shared.searchQuery    = nil
        
        searchItemHandler()
        endSearch(bar)        
    }
    
    
    /// ---> Function for processing a search text  <--- ///
    func handleSearchText(_ text: String, at bar: UISearchBar) {
        if text.isEmpty {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.restoreAllMovies()
            }
        }
    }
    
    
    /// ---> Function for close search  <--- ///
    func endSearch(_ bar: UISearchBar) {
        restoreAllMovies()
        bar.resignFirstResponder()
    }
    
    
    /// ---> Function for show/hide search bar  <--- ///
    func showSearchBar(_ show: Bool) {
        let constraint = searchView.constraints.filter { $0.identifier == "searchViewHeight" }.first
        if let height = constraint {
            if show {
                height.constant = 44.0

                searchBar.becomeFirstResponder()
            } else {
                height.constant = 0.0

                searchBar.resignFirstResponder()
            }
            
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
                self.searchBar.isHidden = !show
            }
        }
    }
}
