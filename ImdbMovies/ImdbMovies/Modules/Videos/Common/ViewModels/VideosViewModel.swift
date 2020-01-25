//
//  VideosViewModel.swift
//  ImdbMovies
//
//  Created by Rost on 25.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class VideosViewModel {
    
    /// ---> Function for UI customisations  <--- ///
    func setupUI(_ view: VideosViewController) {
        view.videosTable.tableFooterView = UIView()
    }

    
    /// ---> Function for make custom cells based on index of row  <--- ///
    func makeCell(_ view: VideosViewController, table: UITableView, at index: IndexPath) -> UITableViewCell {

        if let cell = table.dequeueReusableCell(withIdentifier: "VideosCell", for: index) as? VideosCell {
            
            let object = view.dataArray[index.row]
            
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
    func makeRowsCount(_ view: VideosViewController) -> Int {
        return view.dataArray.count
    }
    
    
    /// ---> Function for present details view  <--- ///
    func presentDetails(_ view: VideosViewController, index: Int) {
        let selectedVideo = view.dataArray[index]
        
        DataContainer.shared.videoObject   = selectedVideo
        
        Router.present("Web", from: view)
    }
}
