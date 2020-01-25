//
//  MoviesViewModel.swift
//  ImdbMovies
//
//  Created by Rost on 24.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class MoviesViewModel {
    
    /// ---> Function for UI customisations  <--- ///
    func setupUI(_ view: MoviesViewController) {
        view.sortView.alpha = 0.0
        
        view.cellMargin = 5.0
    }
     
    
    /// ---> Function for make custom cells based on index of row  <--- ///
    func makeCell(_ sender: UICollectionView, array: [MovieObject], index: IndexPath) -> UICollectionViewCell {
        if let cell = sender.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: index) as? MovieCell {
            let movie = array[index.item]

            if let model = cell.viewModel {
                model.setValues(cell, object: movie, index: index.item)
            }
            
            return cell
        }
        
        return UICollectionViewCell()
    }

    
    /// ---> Function for present details view  <--- ///
    func presentDetails(_ view: MoviesViewController, index: Int) {
        let selectedMovie = view.dataArray[index]
        
        DataContainer.shared.selectedMovieId   = selectedMovie.objectId
        
        Router.present("MovieDetails", from: view)
    }
    
    
    /// ---> Function for download next page for list of movies  <--- ///
    func loadNextPage(_ view: MoviesViewController, index: Int) {
        if index >= view.dataArray.count - 5 {
            if view.dataArray.count > 0 && view.isDataLoading == false {
                if let total = DataContainer.shared.totalPages {
                    if view.currentPage < total {
                        view.isDataLoading = true
                        
                        if let search = DataContainer.shared.searchQuery {
                            view.searchPage += 1
                            
                            if let manager = view.endpointsManager {
                                manager.loadSearch(view, query: search, page: view.searchPage)
                            }
                        } else {
                            view.currentPage += 1
                            
                            if let manager = view.endpointsManager {
                                manager.loadMovies(view, page: view.currentPage)
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    /// ---> Function for scroll list of movies to top  <--- ///
    func scrollMoviesToTop(_ view: MoviesViewController) {
        view.moviesView.reloadData()
        view.moviesView.setContentOffset(CGPoint(x: 0,y: 0), animated: true)
    }
}
