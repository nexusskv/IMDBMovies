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
    var imdbId                  = 0
    var isAdult                 = false
    var posterPath              = ""
    var iconPath                = ""
    var budget                  = 0
    var homepage                = ""
    var origLang                = ""
    var origTitle               = ""
    var movieTitle              = ""
    var overview                = ""
    var popularity              = 0.0
    var belongToCollection      = CollectionObject()
    var genres                  = [GenreObject]()
    var prodCompanies           = [ProdCompanyObject]()
    var prodCountries           = [ProdCountryObject]()
    var spokenLangs             = [SpokenLangObject]()
    var releaseDate             = ""
    var revenue                 = 0
    var runtime                 = 0
    var status                  = ""
    var tagline                 = ""
    var isVideo                 = false
    var voteCount               = 0
    var voteAvg                 = 0.0
}

