//
//  WebViewController+Actions.swift
//  ImdbMovies
//
//  Created by Rost on 20.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension WebViewController {
    
    /// ---> Action for back item in the navigation bar  <--- ///
    @IBAction func backItemTapped() {
        Router.dismiss(self)
    }
}
