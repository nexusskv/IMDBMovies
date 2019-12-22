//
//  MoviesViewController+Actions.swift
//  ImdbMovies
//
//  Created by Rost on 19.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MoviesViewController {
    
    /// ---> Action for show sort view <--- ///
    @IBAction func sortItemTapped() {
        displaySortView()
    }
    
    
    /// ---> Action for show details of movie <--- ///
    @IBAction func movieButtonTapped(_ sender: UIButton) {
        presentDetails(sender.tag)
    }
    
    
    /// ---> Action for sort buttons  <--- ///
    @IBAction func sortMoviesButtonTapped(_ sender: UIButton) {
        sortActionHandler(sender.tag)
    }
    
    
    /// ---> Actions for search item  <--- ///
    @IBAction func searchItemTapped() {
        searchItemHandler()
    }
    
    
    /// ---> Action for ok/cancel buttons  <--- ///
    @IBAction func confirmActionButtonTapped(_ sender: UIButton) {
        confirmActionHandler(sender.tag)
    }
}
