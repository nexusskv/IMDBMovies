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
let detailsUrl      = apiUrl + "/" + movieParam
let iconUrl         = "https://image.tmdb.org/t/p/w300"
let imageUrl        = "https://image.tmdb.org/t/p"      // + Size screen
let youtubeUrl      = "https://www.youtube.com/watch?v" // =KEY_FROM_RESPONCE
let vimeoUrl        = "https://vimeo.com"   // /KEY

let movieParam      = "movie"
let searchParam     = "search/movie"

let apiKeyParam     = "api_key" + "=" + apiKey
let keyLangParam    = apiKeyParam + "&" + langParam
let playingParam    = "now_playing"
let videosParam     = "videos"
let langParam       = "language=en-US"
let pageParam       = "page"
let adultParam      = "include_adult"


let maxMovieRating  = 10
