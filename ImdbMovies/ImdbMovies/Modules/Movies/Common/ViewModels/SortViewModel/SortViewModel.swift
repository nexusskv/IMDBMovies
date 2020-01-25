//
//  SortViewModel.swift
//  ImdbMovies
//
//  Created by Rost on 25.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class SortViewModel {
    
    /// ---> Function for UI customisations  <--- ///
    func setupUI(_ view: SortView) {
        view.roundCorners(10.0, border: 1.5, color: .darkGray)
        view.okButton.roundCorners(10.0, border: 0.5, color: .lightGray)
        
        let halfRadius = view.cancelButton.frame.size.width / 2.0
        view.cancelButton.roundCorners(halfRadius, border: 0.5, color: .lightGray)
        
        view.sortTable.tableFooterView = UIView()
        
        view.titlesArray = ["Date ascending", "Date descending",
                            "Title ascending", "Title descending",
                            "Popular ascending", "Popular descending",
                            "Vote count ascending", "Vote count descending",
                            "Vote average ascending", "Vote average descending"]

        if DataContainer.shared.selectedSortType != .none {
            view.currentSort = DataContainer.shared.selectedSortType
        }
        
        view.sortTable.reloadData()
    }
        
    /// ---> Function for make custom cells based on index of row  <--- ///
    func makeCell(_ view: SortView, table: UITableView, at index: IndexPath) -> UITableViewCell {
        if let cell = table.dequeueReusableCell(withIdentifier: "SortCell", for: index) as? SortCell {
            let title = view.titlesArray[index.row]
            
            if let model = cell.viewModel {
                model.setValues(cell, value: title, index: index.row, sort: view.currentSort.rawValue)
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    /// ---> Function for make custom height based on index of row  <--- ///
    func makeHeight(_ index: Int) -> CGFloat {
        return 52.0
    }
    
    
    /// ---> Function for make count of rows  <--- ///
    func makeRowsCount(_ view: SortView) -> Int {
        return view.titlesArray.count
    }
    
    
    /// ---> Function for mark row as selected  <--- ///
    func tableRowDidSelected(_ view: SortView, index: Int) {
        if let type = MoviesSortTypes(rawValue: index) {
            view.currentSort = type
        }
        
        view.sortTable.reloadData()
    }
}
