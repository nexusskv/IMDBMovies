//
//  SearchManager.swift
//  ImdbMovies
//
//  Created by Rost on 24.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class SearchManager {
    
    /// ---> Fucntions handle tap by search item in the navigation bar <--- ///
    func searchItemHandler(_ view: MoviesViewController) {
        if let manager = view.searchManager {
            if view.searchBar.isHidden {
                manager.showSearchBar(view, show: true)
            } else {
                manager.showSearchBar(view, show: false)
            }
        }
    }
    
    
    /// ---> Function for processing a search string  <--- ///
    func handleSearch(_ view: MoviesViewController, bar: UISearchBar) {
        if let query = bar.text, query.count > 2 {
            if let manager = view.searchManager {
                manager.searchItemHandler(view)
                manager.endSearch(view, bar: bar)
            }
            
            view.currentPage = 1
            view.dataArray   = []
            
            DataContainer.shared.searchQuery = query
            
            if let manager = view.endpointsManager {
                manager.loadSearch(view, query: query, page: view.searchPage)
            }

            if DataContainer.shared.selectedSortType != .none {
                if let manager = view.sortManager {
                    manager.sortMovies(view, type: DataContainer.shared.selectedSortType)
                }
            }
        } else {
            AlertPresenter.showAlert(view, message: "Please enter a title of movie for search.")
            if let manager = view.sortManager {
                manager.restoreAllMovies(view)
            }
        }
    }
    
    
    /// ---> Function for processing a search cancel button  <--- ///
    func handleSearchCancel(_ view: MoviesViewController, bar: UISearchBar) {
        bar.text = nil
        
        view.searchPage                          = 1
        DataContainer.shared.searchQuery    = nil
        
        if let manager = view.searchManager {
            manager.searchItemHandler(view)
            manager.endSearch(view, bar: bar)
        }
    }
    
    
    /// ---> Function for processing a search text  <--- ///
    func handleSearchText(_ view: MoviesViewController, text: String, at bar: UISearchBar) {
        if text.isEmpty {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if let manager = view.sortManager {
                    manager.restoreAllMovies(view)
                }
            }
        }
    }
    
    
    /// ---> Function for close search  <--- ///
    func endSearch(_ view: MoviesViewController, bar: UISearchBar) {
        if let manager = view.sortManager {
            manager.restoreAllMovies(view)
        }
        
        bar.resignFirstResponder()
    }
    
    
    /// ---> Function for show/hide search bar  <--- ///
    func showSearchBar(_ view: MoviesViewController, show: Bool) {
        let constraint = view.searchView.constraints.filter { $0.identifier == "searchViewHeight" }.first
        if let height = constraint {
            if show {
                height.constant = 44.0

                view.searchBar.becomeFirstResponder()
            } else {
                height.constant = 0.0

                view.searchBar.resignFirstResponder()
            }
            
            UIView.animate(withDuration: 0.5) {
                view.view.layoutIfNeeded()
                view.searchBar.isHidden = !show
            }
        }
    }
}
