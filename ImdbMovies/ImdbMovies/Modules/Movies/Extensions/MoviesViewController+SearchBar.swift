//
//  MoviesViewController+SearchBar.swift
//  ImdbMovies
//
//  Created by Rost on 17.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MoviesViewController: UISearchBarDelegate {
    
    /// ---> Fucntion of search bar delegate protocol <--- ///
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    
    /// ---> Fucntion of search bar delegate protocol <--- ///
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if let manager = searchManager {
            manager.handleSearchCancel(self, bar: searchBar)
        }
    }
    
    
    /// ---> Fucntion of search bar delegate protocol <--- ///
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let manager = searchManager {
            manager.handleSearch(self, bar: searchBar)
        }
    }
    
    
    /// ---> Fucntion of search bar delegate protocol <--- ///
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let manager = searchManager {
            manager.handleSearchText(self, text: searchText, at: searchBar)
        }
    }
}
