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
    
    /// ---> Function for show sort view <--- ///
    @IBAction func sortItemTapped() {
        displaySortView()
    }
    
    
    /// ---> Function for show details of movie <--- ///
    @IBAction func movieButtonTapped(_ sender: UIButton) {
        presentDetails(sender.tag)
    }
    
    
    /// ---> Actions for types of sort buttons  <--- ///
    @IBAction func sortMoviesButtonTapped(_ sender: UIButton) {
        sortActionHandler(sender.tag)
    }
    
    
    /// ---> Function for ok/close buttons  <--- ///
    @IBAction func confirmActionButtonTapped(_ sender: UIButton) {
        confirmActionHandler(sender.tag)
    }
}
