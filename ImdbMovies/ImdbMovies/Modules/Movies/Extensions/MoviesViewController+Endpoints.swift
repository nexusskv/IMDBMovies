//
//  MoviesViewController+Endpoints.swift
//  ImdbMovies
//
//  Created by Rost on 17.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MoviesViewController {
    
    /// ---> Function for download data source from server API <--- ///
    func loadMovies(_ page: Int) {
        GetMoviesData.loadList(page, completion: { [weak self] result in
            guard let strongSelf = self else {
              return
            }
            
            strongSelf.handleLoadedResult(result)
        })
    }
}
