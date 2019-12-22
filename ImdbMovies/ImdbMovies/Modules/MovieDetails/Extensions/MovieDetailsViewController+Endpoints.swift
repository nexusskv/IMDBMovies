//
//  MovieDetailsViewController+Endpoints.swift
//  ImdbMovies
//
//  Created by Rost on 19.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MovieDetailsViewController {
    
    /// ---> Function for download data source from server API <--- ///
    func loadMovieDetails() {
        if let value = DataContainer.shared.selectedMovieId {
            activityIndicator.startAnimating()
            
            GetMovieDetails.loadDetails(value, completion: { [weak self] result in
                guard let strongSelf = self else {
                  return
                }
                
                strongSelf.handleLoadedResult(result)
            })
        }
    }
    
    
    /// ---> Function for processing a received result  <--- ///
    func handleLoadedResult(_ result: AnyObject) {
        activityIndicator.stopAnimating()
        
        if result is MovieDetailsObject {
            if let details = result as? MovieDetailsObject {
                detailsObject = details

                detailsTable.reloadData()
            } else {
                AlertPresenter.showAlert(self, message: "You received empty data.", completion: { flag in
                    Router.dismiss(self)
                })
            }
        } else if result is String {
            AlertPresenter.showAlert(self, message: result as! String, completion: { flag in
                Router.dismiss(self)
            })
        }
    }
}
