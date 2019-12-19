//
//  MoviesViewController+Sort.swift
//  ImdbMovies
//
//  Created by Rost on 18.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MoviesViewController {
    
    /// ---> Function for display a view with types of sort  <--- ///
    func displaySortView() {
        if sortView.alpha > 0.0 {
            sortView.fadeOut()
        } else {
            sortView.fadeIn()
            sortView.addCheckmarks(sortView.sortType)
        }
    }
    
    
    /// ---> Function for processing a select sort buttons  <--- ///
    func sortActionHandler(_ value: Int) {
        if let type = MoviesSortTypes(rawValue: value) {
            sortView.cleanCheckmarks()
            
            sortView.addCheckmarks(type)
            
            selectedSortType = type
        }
    }
    
    
    /// ---> Function for processing a select ok/close buttons  <--- ///
    func confirmActionHandler(_ value: Int) {
        if let type = ConfirmActionsTypes(rawValue: value) {
            switch type {
                case .cancel:
                   sortView.fadeOut()
                   sortView.cleanCheckmarks()
                   selectedSortType = .none
                case .ok:
                    if selectedSortType == .none {
                            AlertPresenter.showAlert(self,
                                                     message: "Please select ascending or descending type for sort companies. \n For hide this dialog just tap by X button.")
                    } else {
                            sortView.fadeOut()                            
                            sortMovies(selectedSortType)
                    }
                
                    sortView.sortType = selectedSortType
            }
        }
    }
    
    
    /// ---> Function for processing a sort data by selected type  <--- ///
    func sortMovies(_ type: MoviesSortTypes) {
        switch type {
            case .dateAsc:
                dataArray = dataArray.sorted(by: { $0.releaseDate < $1.releaseDate })
            case .dateDesc:
                dataArray = dataArray.sorted(by: { $0.releaseDate > $1.releaseDate })
            case .titleAsc:
                dataArray = dataArray.sorted(by: { $0.movieTitle < $1.movieTitle })
            case .titleDesc:
                dataArray = dataArray.sorted(by: { $0.movieTitle > $1.movieTitle })
            case .popularAsc:
                dataArray = dataArray.sorted(by: { $0.popularity < $1.popularity })
            case .popularDesc:
                dataArray = dataArray.sorted(by: { $0.popularity > $1.popularity })
            case .voteCountAsc:
                dataArray = dataArray.sorted(by: { $0.voteCount < $1.voteCount })
            case .voteCountDesc:
                dataArray = dataArray.sorted(by: { $0.voteCount > $1.voteCount })
            case .voteAvgAsc:
                dataArray = dataArray.sorted(by: { $0.voteAvg < $1.voteAvg })
            case .voteAvgDesc:
                dataArray = dataArray.sorted(by: { $0.voteAvg > $1.voteAvg })
            default:
                break
        }
        
        moviesView.reloadData()
    }
    
    
    /// ---> Function for restore start data <--- ///
    func restoreAllMovies() {
        dataArray = originalDataArray
        
        if selectedSortType != .none {
            sortMovies(selectedSortType)
        }
        
        moviesView.reloadData()
    }
}
