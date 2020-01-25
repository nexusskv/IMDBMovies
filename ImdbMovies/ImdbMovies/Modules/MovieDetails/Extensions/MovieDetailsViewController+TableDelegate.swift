//
//  MovieDetailsViewController+TableDelegate.swift
//  ImdbMovies
//
//  Created by Rost on 22.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MovieDetailsViewController: UITableViewDelegate {
    
    /// ---> Function of table view delegate protocol <--- ///
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.makeHeight(self, index: indexPath.row)
    }
    
    
    /// ---> Function of table view delegate protocol <--- ///
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        viewModel.presentDetails(self, index: indexPath.row)
    }
}
