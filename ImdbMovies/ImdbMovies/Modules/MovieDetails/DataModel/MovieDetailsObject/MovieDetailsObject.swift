//
//  MovieDetailsObject.swift
//  ImdbMovies
//
//  Created by Rost on 18.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


struct MovieDetailsObject {
    var objectId                = 0
    var imdbId                  = ""
    var posterPath              = ""
    var iconPath                = ""
    var budget                  = 0
    var homepage                = ""
    var movieTitle              = ""
    var overview                = ""
    var popularity              = 0.0
    var genres                  = [GenreObject]()
    var releaseDate             = ""
    var runtime                 = 0
    var tagline                 = ""
    var voteCount               = 0
    var voteAvg                 = 0.0
}

