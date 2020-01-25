//
//  DetailsEndpointsManager.swift
//  ImdbMovies
//
//  Created by Rost on 25.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class DetailsEndpointsManager {
    
    /// ---> Function for download data source from server API <--- ///
    func loadMovieDetails(_ view: MovieDetailsViewController) {
        if let value = DataContainer.shared.selectedMovieId {
            view.activityIndicator.startAnimating()
            
            GetMovieDetails.loadDetails(value, completion: { [weak self] result in
                guard let strongSelf = self else {
                  return
                }
                
                strongSelf.handleLoadedResult(view, result: result)
            })
        }
    }
    
    
    /// ---> Function for processing a received result  <--- ///
    func handleLoadedResult(_ view: MovieDetailsViewController, result: AnyObject) {
        view.activityIndicator.stopAnimating()
        
        if result is MovieDetailsObject {
            if let details = result as? MovieDetailsObject {
                view.detailsObject = details

                view.detailsTable.reloadData()
            } else {
                AlertPresenter.showAlert(view, message: "You received empty data.", completion: { flag in
                    Router.dismiss(view)
                })
            }
        } else if result is String {
            AlertPresenter.showAlert(view, message: result as! String, completion: { flag in
                Router.dismiss(view)
            })
        }
    }
}
