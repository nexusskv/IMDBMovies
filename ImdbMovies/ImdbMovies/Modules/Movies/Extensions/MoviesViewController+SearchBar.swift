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
    
    /// ---> Search bar delegate functions <--- ///
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        handleSearchCancel(searchBar)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {        
        handleSearch(searchBar)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        handleSearchText(searchText, at: searchBar)
    }
}
