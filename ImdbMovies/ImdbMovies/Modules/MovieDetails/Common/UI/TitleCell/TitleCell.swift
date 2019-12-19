//
//  TitleCell.swift
//  ImdbMovies
//
//  Created by Rost on 19.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class TitleCell: BaseTableCell {
    @IBOutlet weak var movieTitle: UILabel!
        
    /// ---> Setter for values on UI <--- ///
    override func setDetailsValues(_ object: MovieDetailsObject) {
        movieTitle.text = object.movieTitle
    }
}
