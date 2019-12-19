//
//  MovieDetailsViewController+Functions.swift
//  ImdbMovies
//
//  Created by Rost on 19.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MovieDetailsViewController {
    
    /// ---> Function for UI customisations  <--- ///
    func setupUI() {
        detailsTable.tableFooterView = UIView()

        cellTypes = DetailsTableCells.getCellTypes()
    }
        
    /// ---> Function for make custom cells based on index of row  <--- ///
    func makeCell(_ sender: UITableView, at index: IndexPath) -> UITableViewCell {
        if let object = detailsObject {
            let typeCell        = cellTypes[index.row]
            let reuseId         = typeCell.getName()
            let cell = sender.dequeueReusableCell(withIdentifier: reuseId, for: index) as! BaseTableCell
            
            cell.setDetailsValues(object)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    /// ---> Function for make custom height based on index of row  <--- ///
    func makeHeight(_ index: Int) -> CGFloat {
        let type = cellTypes[index]
        
        return type.getHeight()
    }
    
    
    /// ---> Function for make count of rows  <--- ///
    func makeRowsCount() -> Int {
        if detailsObject != nil {
            let rowsCount = cellTypes.count
            return rowsCount
        }
        
        return 0
    }
}
