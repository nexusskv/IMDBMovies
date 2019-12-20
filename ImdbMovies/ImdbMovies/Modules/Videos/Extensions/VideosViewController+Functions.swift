//
//  VideosViewController+Functions.swift
//  ImdbMovies
//
//  Created by Rost on 18.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension VideosViewController {
            
    /// ---> Function for UI customisations  <--- ///
    func setupUI() {
        videosTable.tableFooterView = UIView()
    }

    
    /// ---> Function for make custom cells based on index of row  <--- ///
    func makeCell(_ sender: UITableView, at index: IndexPath) -> UITableViewCell {

        if let cell = sender.dequeueReusableCell(withIdentifier: "VideosCell", for: index) as? VideosCell {
            
            let object = dataArray[index.row]
            
            cell.setValues(object)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    /// ---> Function for make custom height based on index of row  <--- ///
    func makeHeight(_ index: Int) -> CGFloat {
        return 66.0
    }
    
    
    /// ---> Function for make count of rows  <--- ///
    func makeRowsCount() -> Int {
        return dataArray.count
    }
    
    
    /// ---> Function for present details view  <--- ///
    func presentDetails(_ index: Int) {
        let selectedVideo = dataArray[index]
        
        DataContainer.shared.videoObject   = selectedVideo
        
        Router.present("Web", from: self)
    }
}
