//
//  MovieCell.swift
//  ImdbMovies
//
//  Created by Rost on 18.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class MovieCell: UICollectionViewCell {
    @IBOutlet weak var posterImageView: AsyncImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingView: StarsView!
    @IBOutlet weak var dateLabel: UILabel!
    
    /// ---> Function for add UI customizations <--- ///
    func setupUI() {
        contentView.roundCorners(7, border: 0.4, color: .lightGray)
    }
    
    
    /// ---> Function set cell by fixed size <--- ///
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes)
        -> UICollectionViewLayoutAttributes {
      return layoutAttributes
    }
}
