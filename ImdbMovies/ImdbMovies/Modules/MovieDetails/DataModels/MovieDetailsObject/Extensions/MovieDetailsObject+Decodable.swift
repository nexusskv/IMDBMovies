//
//  MovieDetailsObject+Decodable.swift
//  ImdbMovies
//
//  Created by Rost on 18.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


extension MovieDetailsObject: Decodable {
    
    /// ---> Function decode all properties from json container <--- ///
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: MovieDetailsCodingKeys.self)
        if let value = try values.decodeIfPresent(Int.self, forKey: .objectId) {
            objectId = value
        }
                
        if let value = try values.decodeIfPresent(Int.self, forKey: .imdbId) {
            imdbId = value
        }
        
        if let value = try values.decodeIfPresent(Int.self, forKey: .budget) {
            budget = value
        }
        
        if let value = try values.decodeIfPresent(Int.self, forKey: .voteCount) {
            voteCount = value
        }
        
        if let value = try values.decodeIfPresent(Double.self, forKey: .voteAvg) {
            voteAvg = value
        }
        
        if let value = try values.decodeIfPresent(Double.self, forKey: .popularity) {
            popularity = value
        }
                
        if let value = try values.decodeIfPresent(String.self, forKey: .homepage) {
            homepage = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .releaseDate) {
            releaseDate = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .posterPath) {
            posterPath = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .iconPath) {
            iconPath = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .overview) {
            overview = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .movieTitle) {
            movieTitle = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .origTitle) {
            origTitle = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .origLang) {
            origLang = value
        }
        
        if let value = try values.decodeIfPresent(Bool.self, forKey: .isAdult) {
            isAdult = value
        }
        
        if let value = try values.decodeIfPresent(Bool.self, forKey: .isVideo) {
            isVideo = value
        }
        
        if let value = try values.decodeIfPresent(CollectionObject.self,
                                                  forKey: .belongToCollection) {
            belongToCollection = value
        }
        
        if let value = try values.decodeIfPresent([GenreObject].self,
                                                  forKey: .genres) {
            genres = value
        }
        
        if let value = try values.decodeIfPresent([ProdCompanyObject].self,
                                                  forKey: .prodCompanies) {
            prodCompanies = value
        }
        
        if let value = try values.decodeIfPresent([ProdCountryObject].self,
                                                  forKey: .prodCountries) {
            prodCountries = value
        }
        
        if let value = try values.decodeIfPresent([SpokenLangObject].self,
                                                  forKey: .spokenLangs) {
            spokenLangs = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .releaseDate) {
            releaseDate = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .status) {
            status = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .tagline) {
            tagline = value
        }
        
        if let value = try values.decodeIfPresent(Int.self, forKey: .revenue) {
            revenue = value
        }
        
        if let value = try values.decodeIfPresent(Int.self, forKey: .runtime) {
            runtime = value
        }
    }
}
