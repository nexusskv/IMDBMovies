//
//  VideosCell+Setter.swift
//  ImdbMovies
//
//  Created by Rost on 20.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension VideosCell {
    
    /// ---> Setter for values on UI <--- ///
    func setValues(_ object: VideosObject) {
        videoTitle.text = object.name
    }
}
