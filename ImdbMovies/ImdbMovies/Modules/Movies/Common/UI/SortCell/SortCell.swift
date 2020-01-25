//
//  SortCell.swift
//  ImdbMovies
//
//  Created by Rost on 20.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class SortCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sortButton: UIButton!
    var viewModel: SortCellViewModel!
    
    /// ---> View life cycle <--- ///
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewModel = SortCellViewModel()
    }
}
