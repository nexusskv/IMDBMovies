//
//  PosterCell.swift
//  ImdbMovies
//
//  Created by Rost on 19.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class PosterCell: BaseTableCell {
    @IBOutlet weak var posterImageView: AsyncImageView!
    
    /// ---> Setter for values on UI <--- ///
    override func setDetailsValues(_ object: MovieDetailsObject) {
        posterImageView.setUrl(object.iconPath)
    }
}
