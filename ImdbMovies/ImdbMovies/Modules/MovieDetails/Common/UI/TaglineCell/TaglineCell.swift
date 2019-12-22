//
//  TaglineCell.swift
//  ImdbMovies
//
//  Created by Rost on 22.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class TaglineCell: TitleCell {

        
    /// ---> Setter for values on UI <--- ///
    override func setDetailsValues(_ object: MovieDetailsObject) {
        if !object.tagline.isEmpty {
            textTitle.text = "\"" + object.tagline +  "\""
        } else {
            textTitle.text = "-"
        }
    }
}
