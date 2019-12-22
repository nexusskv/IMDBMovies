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
    
    
    /// ---> Function for download next page for list of movies  <--- ///
    func loadNextPage(_ index: Int) {
        if index >= dataArray.count - 5 {
            if dataArray.count > 0 && isDataLoading == false {
                if let total = DataContainer.shared.totalPages {
                    if currentPage < total {
                        isDataLoading = true
                        
                        if let search = DataContainer.shared.searchQuery {
                            searchPage += 1

                            loadSearch(search, page: searchPage)
                        } else {
                            currentPage += 1

                            loadMovies(currentPage)
                        }
                    }
                }
            }
        }
    }
    
    
    /// ---> Function for scroll list of movies to top  <--- ///
    func scrollMoviesToTop() {
        moviesView.reloadData()
        moviesView.setContentOffset(CGPoint(x: 0,y: 0), animated: true)
    }
}
