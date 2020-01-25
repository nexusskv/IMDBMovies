//
//  MovieDetailsViewController+TableDataSource.swift
//  ImdbMovies
//
//  Created by Rost on 19.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MovieDetailsViewController: UITableViewDataSource {
            
    /// ---> Function of table view data source protocol <--- ///
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewModel.makeCell(self, table: tableView, at: indexPath)

        return cell
    }
    
    
    /// ---> Function of table view data source protocol <--- ///
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {        
        return viewModel.makeRowsCount(self)
    }
}
