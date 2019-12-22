//
//  Enums.swift
//  ImdbMovies
//
//  Created by Rost on 17.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


/// ---> Coding keys for decoding values in the movie object <--- ///
enum MoviesCodingKeys: String, CodingKey {
    case objectId       = "id"
    case voteCount      = "vote_count"
    case voteAvg        = "vote_average"
    case isVideo        = "video"
    case posterPath     = "poster_path"
    case iconPath       = "backdrop_path"
    case isAdult        = "adult"
    case origLang       = "original_language"
    case origTitle      = "original_title"
    case movieTitle     = "title"
    case releaseDate    = "release_date"
    case genreIds       = "genre_ids"
    case overview
    case popularity
}


/// ---> Coding keys for decoding values in the movie details object <--- ///
enum MovieDetailsCodingKeys: String, CodingKey {
    case objectId           = "id"
    case imdbId             = "imdb_id"
    case voteCount          = "vote_count"
    case voteAvg            = "vote_average"
    case isVideo            = "video"
    case origTitle          = "original_title"
    case movieTitle         = "title"
    case posterPath         = "poster_path"
    case iconPath           = "backdrop_path"
    case isAdult            = "adult"
    case origLang           = "original_language"
    case releaseDate        = "release_date"
    case prodCompanies      = "production_companies"
    case prodCountries      = "production_countries"
    case spokenLangs        = "spoken_languages"
    case belongToCollection = "belongs_to_collection"
    case genres             
    case homepage
    case budget
    case runtime
    case revenue
    case status
    case tagline
    case overview
    case popularity
}


/// ---> Coding keys for decoding values in the genre object <--- ///
enum GenreCodingKeys: String, CodingKey {
    case objectId           = "id"
    case name
}


/// ---> Coding keys for decoding values in the video object <--- ///
enum VideoCodingKeys: String, CodingKey {
    case objectId       = "id"
    case key
    case name
    case site
}
