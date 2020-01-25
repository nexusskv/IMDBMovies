//
//  SortManager.swift
//  ImdbMovies
//
//  Created by Rost on 24.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class SortManager {
    
    /// ---> Function for display a view with types of sort  <--- ///
    func displaySortView(_ view: MoviesViewController) {
        if view.sortView.alpha > 0.0 {
            view.sortView.fadeOut()
        } else {
            view.sortView.fadeIn()
            view.sortView.sortTable.reloadData()
        }
    }
    
    
    /// ---> Function for processing a select sort buttons  <--- ///
    func sortActionHandler(_ view: MoviesViewController, value: Int) {
        if let type = MoviesSortTypes(rawValue: value) {
            view.sortView.currentSort = type
            view.sortView.sortTable.reloadData()
        }
    }
    
    
    /// ---> Function for processing a select ok/close buttons  <--- ///
    func confirmActionHandler(_ view: MoviesViewController, value: Int) {
        if let type = ConfirmActionsTypes(rawValue: value) {
            switch type {
                case .cancel:
                    view.sortView.currentSort = .none
                    view.sortView.fadeOut()
                case .ok:
                    if view.sortView.currentSort == .none {
                            AlertPresenter.showAlert(view,
                                                     message: "Please select ascending or descending type for sort movies. \n For hide this dialog just tap by X button.")
                    } else {
                        DataContainer.shared.selectedSortType = view.sortView.currentSort
                        view.sortView.fadeOut()
                        sortMovies(view, type: DataContainer.shared.selectedSortType)
                    }
            }
        }
    }
    
    
    /// ---> Function for processing a sort data by selected type  <--- ///
    func sortMovies(_ view: MoviesViewController, type: MoviesSortTypes) {
        let sortArray = view.dataArray
        
        switch type {
            case .dateAsc:
                view.dataArray = sortArray.sorted(by: { $0.releaseDate < $1.releaseDate })
            case .dateDesc:
                view.dataArray = sortArray.sorted(by: { $0.releaseDate > $1.releaseDate })
            case .titleAsc:
                view.dataArray = sortArray.sorted(by: { $0.movieTitle < $1.movieTitle })
            case .titleDesc:
                view.dataArray = sortArray.sorted(by: { $0.movieTitle > $1.movieTitle })
            case .popularAsc:
                view.dataArray = sortArray.sorted(by: { $0.popularity < $1.popularity })
            case .popularDesc:
                view.dataArray = sortArray.sorted(by: { $0.popularity > $1.popularity })
            case .voteCountAsc:
                view.dataArray = sortArray.sorted(by: { $0.voteCount < $1.voteCount })
            case .voteCountDesc:
                view.dataArray = sortArray.sorted(by: { $0.voteCount > $1.voteCount })
            case .voteAvgAsc:
                view.dataArray = sortArray.sorted(by: { $0.voteAvg < $1.voteAvg })
            case .voteAvgDesc:
                view.dataArray = sortArray.sorted(by: { $0.voteAvg > $1.voteAvg })
            default:
                break
        }
        
        view.moviesView.reloadData()
    }
    
    
    /// ---> Function for restore start data <--- ///
    func restoreAllMovies(_ view: MoviesViewController) {
        view.dataArray = view.originalDataArray
        
        if DataContainer.shared.selectedSortType != .none {
            sortMovies(view, type: DataContainer.shared.selectedSortType)
        }
        
        if let model = view.viewModel {
            model.scrollMoviesToTop(view)
        }
    }
}
