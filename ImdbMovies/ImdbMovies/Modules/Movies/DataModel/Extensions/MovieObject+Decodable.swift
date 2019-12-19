//
//  MovieObject+Decodable.swift
//  ImdbMovies
//
//  Created by Rost on 17.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


extension MovieObject: Decodable {
    
    /// ---> Function decode all properties from json container <--- ///
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: MoviesCodingKeys.self)
        if let value = try values.decodeIfPresent(Int.self, forKey: .objectId) {
            objectId = value
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
        
        if let value = try values.decodeIfPresent([Int].self, forKey: .genreIds) {
            genreIds = value
        }
    }
}
