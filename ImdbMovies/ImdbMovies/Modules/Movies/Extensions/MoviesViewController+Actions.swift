//
//  MoviesViewController+Actions.swift
//  ImdbMovies
//
//  Created by Rost on 19.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MoviesViewController {
    
    @IBAction func sortItemTapped() {
        
    }
    
    @IBAction func movieButtonTapped(_ sender: UIButton) {
        presentDetails(sender.tag)
    }
}
