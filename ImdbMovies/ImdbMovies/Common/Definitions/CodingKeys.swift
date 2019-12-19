//
//  Enums.swift
//  ImdbMovies
//
//  Created by Rost on 17.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


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

enum CollectionCodingKeys: String, CodingKey {
    case objectId           = "id"
    case posterPath         = "poster_path"
    case iconPath           = "backdrop_path"
    case name
}

enum ProdCompanyCodingKeys: String, CodingKey {
    case objectId           = "id"
    case logoPath           = "logo_path"
    case origCountry        = "origin_country"
    case name
}

enum ProdCountryCodingKeys: String, CodingKey {
    case iso_3166_1
    case name
}

enum SpokenLangCodingKeys: String, CodingKey {
    case iso_639_1
    case name
}

enum GenreCodingKeys: String, CodingKey {
    case objectId           = "id"
    case name
}

enum VideoCodingKeys: String, CodingKey {
    case objectId       = "id"
    case key
    case name
    case site
    case size
    case type
}

