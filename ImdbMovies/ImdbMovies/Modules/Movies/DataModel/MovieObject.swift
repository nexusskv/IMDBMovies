//
//  MovieObject.swift
//  ImdbMovies
//
//  Created by Rost on 17.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


struct MovieObject {
    var objectId        = 0
    var voteCount       = 0
    var voteAvg         = 0.0
    var posterPath      = ""
    var iconPath        = ""
    var movieTitle      = ""
    var releaseDate     = ""
    var overview        = ""
    var popularity      = 0.0
    var genreIds        = [Int]()
}
