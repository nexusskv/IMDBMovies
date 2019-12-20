//
//  SortCell+Setter.swift
//  ImdbMovies
//
//  Created by Rost on 20.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension SortCell {
    
    /// ---> Setter for values on UI <--- ///
    func setValues(_ value: String, index: Int, sort: Int) {
        titleLabel.text     = value
        
        sortButton.setBackgroundImage(UIImage(named: "no_checkmark_icon"),
                                      for: .normal)
        
        if index == sort {
            sortButton.setBackgroundImage(UIImage(named: "checkmark_icon"),
                                          for: .normal)
        }

        sortButton.tag      = index
    }
}
