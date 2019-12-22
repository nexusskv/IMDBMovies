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
            sortView.sortTable.reloadData()
        }
    }
    
    
    /// ---> Function for processing a select sort buttons  <--- ///
    func sortActionHandler(_ value: Int) {
        if let type = MoviesSortTypes(rawValue: value) {
            sortView.currentSort = type
            sortView.sortTable.reloadData()
        }
    }
    
    
    /// ---> Function for processing a select ok/close buttons  <--- ///
    func confirmActionHandler(_ value: Int) {
        if let type = ConfirmActionsTypes(rawValue: value) {
            switch type {
                case .cancel:
                    sortView.currentSort = .none
                    sortView.fadeOut()
                case .ok:
                    if sortView.currentSort == .none {
                            AlertPresenter.showAlert(self,
                                                     message: "Please select ascending or descending type for sort movies. \n For hide this dialog just tap by X button.")
                    } else {
                        DataContainer.shared.selectedSortType = sortView.currentSort
                        sortView.fadeOut()
                        sortMovies(DataContainer.shared.selectedSortType)
                    }
            }
        }
    }
    
    
    /// ---> Function for processing a sort data by selected type  <--- ///
    func sortMovies(_ type: MoviesSortTypes) {
        let sortArray = dataArray
        
        switch type {
            case .dateAsc:
                dataArray = sortArray.sorted(by: { $0.releaseDate < $1.releaseDate })
            case .dateDesc:
                dataArray = sortArray.sorted(by: { $0.releaseDate > $1.releaseDate })
            case .titleAsc:
                dataArray = sortArray.sorted(by: { $0.movieTitle < $1.movieTitle })
            case .titleDesc:
                dataArray = sortArray.sorted(by: { $0.movieTitle > $1.movieTitle })
            case .popularAsc:
                dataArray = sortArray.sorted(by: { $0.popularity < $1.popularity })
            case .popularDesc:
                dataArray = sortArray.sorted(by: { $0.popularity > $1.popularity })
            case .voteCountAsc:
                dataArray = sortArray.sorted(by: { $0.voteCount < $1.voteCount })
            case .voteCountDesc:
                dataArray = sortArray.sorted(by: { $0.voteCount > $1.voteCount })
            case .voteAvgAsc:
                dataArray = sortArray.sorted(by: { $0.voteAvg < $1.voteAvg })
            case .voteAvgDesc:
                dataArray = sortArray.sorted(by: { $0.voteAvg > $1.voteAvg })
            default:
                break
        }
        
        moviesView.reloadData()
    }
    
    
    /// ---> Function for restore start data <--- ///
    func restoreAllMovies() {
        dataArray = originalDataArray
        
        if DataContainer.shared.selectedSortType != .none {
            sortMovies(DataContainer.shared.selectedSortType)
        }
        
        scrollMoviesToTop()
    }
}
