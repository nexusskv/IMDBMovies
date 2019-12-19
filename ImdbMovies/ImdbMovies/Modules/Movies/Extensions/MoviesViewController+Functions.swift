//
//  MoviesViewController+Functions.swift
//  ImdbMovies
//
//  Created by Rost on 17.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MoviesViewController {
    
    /// ---> Function for UI customisations  <--- ///
    func setupUI() {
        sortView.alpha = 0.0
        
        cellMargin = 5.0
    }
        
    /// ---> Function for make custom cells based on index of row  <--- ///
    func makeCell(_ sender: UICollectionView, at index: IndexPath) -> UICollectionViewCell {
        let cell = sender.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: index) as? MovieCell
        
        let movie = dataArray[index.item]

        cell?.setValues(movie, index: index.item)
        
        return cell ?? UICollectionViewCell()
    }

    
    /// ---> Function for present details view  <--- ///
    func presentDetails(_ index: Int) {
        let selectedMovie = dataArray[index]
        
        DataContainer.shared.selectedMovieId   = selectedMovie.objectId
        
        Router.present("MovieDetails", from: self)
    }
}
