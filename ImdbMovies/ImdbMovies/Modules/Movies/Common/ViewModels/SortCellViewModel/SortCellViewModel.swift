//
//  SortCellViewModel.swift
//  ImdbMovies
//
//  Created by Rost on 25.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class SortCellViewModel {

    /// ---> Setter for values on UI <--- ///
    func setValues(_ cell: SortCell, value: String, index: Int, sort: Int) {
        cell.titleLabel.text     = value
        
        cell.sortButton.setBackgroundImage(UIImage(named: "no_checkmark_icon"),
                                           for: .normal)
        
        if index == sort {
            cell.sortButton.setBackgroundImage(UIImage(named: "checkmark_icon"),
                                               for: .normal)
        }

        cell.sortButton.tag      = index
    }
}
