//
//  GenreObject+Decodable.swift
//  ImdbMovies
//
//  Created by Rost on 18.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


extension GenreObject: Decodable {
    
    /// ---> Function decode all properties from json container <--- ///
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: GenreCodingKeys.self)
        if let value = try values.decodeIfPresent(Int.self, forKey: .objectId) {
            objectId = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .name) {
            name = value
        }
    }
}
