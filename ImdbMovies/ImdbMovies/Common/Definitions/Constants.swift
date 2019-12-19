//
//  Constants.swift
//  ImdbMovies
//
//  Created by Rost on 17.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


let apiKey          = "301fb81ba21a95f0581119093f49bdaf"
let apiUrl          = "https://api.themoviedb.org/3"
let listUrl         = apiUrl + "/" + movieParam + "/" + playingParam
let iconUrl         = "https://image.tmdb.org/t/p/w200"
let imageUrl        = "https://image.tmdb.org/t/p"      // + Size screen /original or /w320 /w200 is min
let videoUrl        = "https://www.youtube.com/watch?v" // =KEY_FROM_RESPONCE

let movieParam      = "movie"
let searchParam     = "search/movie"

let apiKeyParam     = "api_key" + "=" + apiKey
let playingParam    = "now_playing"
let langParam       = "language=en-US"
let pageParam       = "page"
let adultParam      = "include_adult"
