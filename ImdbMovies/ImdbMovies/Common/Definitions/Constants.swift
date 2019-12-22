//
//  Constants.swift
//  ImdbMovies
//
//  Created by Rost on 17.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation

/// ---> API key <--- ///
let apiKey              = "301fb81ba21a95f0581119093f49bdaf"


/// ---> API urls <--- ///
let apiUrl              = "https://api.themoviedb.org/3"
let listUrl             = apiUrl + "/" + movieParam + "/" + playingParam
let detailsUrl          = apiUrl + "/" + movieParam
let imageUrl            = "https://image.tmdb.org/t/p/w300"      // + Size screen
let youtubeUrl          = "https://www.youtube.com/watch?v" // =KEY_FROM_RESPONCE
let vimeoUrl            = "https://vimeo.com"   // /KEY


/// ---> API params <--- ///
let apiKeyParam         = "api_key" + "=" + apiKey
let keyLangParam        = apiKeyParam + "&" + langParam
let keyLangPageParam    = keyLangParam + "&" + pageParam
let playingParam        = "now_playing"
let videosParam         = "videos"
let movieParam          = "movie"
let searchParam         = "search" + "/" + movieParam
let queryParam          = "query"
let langParam           = "language=en-US"
let pageParam           = "page"
let adultParam          = "include_adult"


/// ---> API request params <--- ///
let defaultTimeout      = 30


/// ---> Stars view params <--- ///
let maxMovieRating      = 10
