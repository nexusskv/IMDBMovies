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
        
    }
        
    /// ---> Function for make custom cells based on index of row  <--- ///
    func makeCell(_ sender: UITableView, at index: IndexPath) -> UITableViewCell {
        let cell = sender.dequeueReusableCell(withIdentifier: "DetailsCell",
        for: index) as? DetailsCell

        
        return cell ?? UITableViewCell()
    }
    
    
    /// ---> Function for make custom height based on index of row  <--- ///
    func makeHeight(_ index: Int) -> CGFloat {
        
        return 0.0
    }
}
