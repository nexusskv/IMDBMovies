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
    @IBOutlet weak var movieButton: UIButton!
    var viewModel: MovieCellViewModel!
    
    /// ---> View life cycle <--- ///
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewModel = MovieCellViewModel()
        
        viewModel.setupUI(self)
    }

    
    /// ---> Function set cell by fixed size <--- ///
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes)
        -> UICollectionViewLayoutAttributes {
      return layoutAttributes
    }
}
