//
//  SortView+Checkmarks.swift
//  ImdbMovies
//
//  Created by Rost on 18.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension SortView {
    
    /// ---> Function reset all checkmark buttons <--- ///
    func cleanCheckmarks() {
        let tags: [Int] = MoviesSortTypes.allMoviesSorts
        ButtonStateSwitcher.shared.cleanCheckmarks(tags, on: self)
    }

    
    /// ---> Function for mark some checkmark button <--- ///
    func addCheckmarks(_ type: MoviesSortTypes) {
        ButtonStateSwitcher.shared.addSortCheckmark(self, type: type.rawValue)
    }
}
