//
//  SortView+Functions.swift
//  ImdbMovies
//
//  Created by Rost on 20.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension SortView {
    
    /// ---> Function for UI customisations  <--- ///
    func setupUI() {
        roundCorners(10.0, border: 1.5, color: .lightGray)
        
        sortTable.tableFooterView = UIView()
        
        titlesArray = ["Date ascending", "Date descending",
                       "Title ascending", "Title descending",
                       "Popular ascending", "Popular descending",
                       "Vote count ascending", "Vote count descending",
                       "Vote average ascending", "Vote average descending"]

        if DataContainer.shared.selectedSortType != .none {
            currentSort = DataContainer.shared.selectedSortType
        }
        
        sortTable.reloadData()
    }
        
    /// ---> Function for make custom cells based on index of row  <--- ///
    func makeCell(_ sender: UITableView, at index: IndexPath) -> UITableViewCell {
        if let cell = sender.dequeueReusableCell(withIdentifier: "SortCell", for: index) as? SortCell {
            let title = titlesArray[index.row]
            
            cell.setValues(title, index: index.row, sort: currentSort.rawValue)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    /// ---> Function for make custom height based on index of row  <--- ///
    func makeHeight(_ index: Int) -> CGFloat {
        return 52.0
    }
    
    
    /// ---> Function for make count of rows  <--- ///
    func makeRowsCount() -> Int {
        return titlesArray.count
    }
    
    
    /// ---> Function for mark row as selected  <--- ///
    func tableRowDidSelected(_ index: Int) {
        if let type = MoviesSortTypes(rawValue: index) {
            currentSort = type
        }
        
        sortTable.reloadData()
    }
}
