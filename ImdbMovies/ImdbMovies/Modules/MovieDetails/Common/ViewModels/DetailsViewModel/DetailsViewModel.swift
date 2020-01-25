//
//  DetailsViewModel.swift
//  ImdbMovies
//
//  Created by Rost on 25.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class DetailsViewModel {
    
    
    /// ---> Function for UI customisations  <--- ///
    func setupUI(_ view: MovieDetailsViewController) {
        view.detailsTable.tableFooterView = UIView()

        view.cellTypes = DetailsTableCells.getCellTypes()
    }
     
    
    /// ---> Function for make custom cells based on index of row  <--- ///
    func makeCell(_ view: MovieDetailsViewController, table: UITableView, at index: IndexPath) -> UITableViewCell {
        if let object = view.detailsObject {
            let typeCell        = view.cellTypes[index.row]
            let reuseId         = typeCell.getName()
            let cell = table.dequeueReusableCell(withIdentifier: reuseId, for: index) as! BaseDetailsCell

            cell.setDetailsValues(object)

            return cell
        }
        
        return UITableViewCell()
    }
    
    
    /// ---> Function for make custom height based on index of row  <--- ///
    func makeHeight(_ view: MovieDetailsViewController, index: Int) -> CGFloat {
        let type = view.cellTypes[index]
        
        return type.getHeight()
    }
    
    
    /// ---> Function for make count of rows  <--- ///
    func makeRowsCount(_ view: MovieDetailsViewController) -> Int {
        if view.detailsObject != nil {
            let rowsCount = view.cellTypes.count
            
            return rowsCount
        }
        
        return 0
    }
    
    
    /// ---> Function for present details view  <--- ///
    func presentDetails(_ view: MovieDetailsViewController, index: Int) {
        let type = DetailsTableCells(rawValue: index)
        if type == .homepage {
            if !view.detailsObject.homepage.isEmpty {
                DataContainer.shared.homepageUrl = view.detailsObject.homepage
                            
                Router.present("Web", from: view)
            } else {
                AlertPresenter.showAlert(view, message: "This movie don't have a home page.")
            }
        } else if type == .video {
            DataContainer.shared.selectedDetailsId = view.detailsObject.objectId
            
            Router.present("Videos", from: view)
        }
    }
}
