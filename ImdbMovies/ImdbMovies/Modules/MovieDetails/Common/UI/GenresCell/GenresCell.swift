//
//  GenresCell.swift
//  ImdbMovies
//
//  Created by Rost on 19.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class GenresCell: BaseDetailsCell {
    @IBOutlet weak var genresLabel: UILabel!
        
    /// ---> Setter for values on UI <--- ///
    override func setDetailsValues(_ object: MovieDetailsObject) {
        var genresString = ""
        for i in 0 ..< object.genres.count {
            let genre = object.genres[i]
            
            genresString.append(genre.name)
            
            if i < object.genres.count - 1 {
                genresString.append(", ")
            }
        }
        
        genresLabel.text = genresString
    }
}
