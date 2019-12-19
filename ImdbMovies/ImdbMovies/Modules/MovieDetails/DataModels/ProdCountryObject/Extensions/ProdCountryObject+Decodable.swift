//
//  ProdCountryObject+Decodable.swift
//  ImdbMovies
//
//  Created by Rost on 18.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


extension ProdCountryObject: Decodable {
    
    /// ---> Function decode all properties from json container <--- ///
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: ProdCountryCodingKeys.self)
        if let value = try values.decodeIfPresent(String.self, forKey: .iso_3166_1) {
            iso3166 = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .name) {
            name = value
        }
    }
}
