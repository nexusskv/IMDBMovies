//
//  VideosObject+Decodable.swift
//  ImdbMovies
//
//  Created by Rost on 19.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


extension VideosObject: Decodable {
    
    /// ---> Function for decode all values from json container <--- ///
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: VideoCodingKeys.self)
        if let value = try values.decodeIfPresent(String.self, forKey: .objectId) {
            objectId = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .key) {
            videoKey = value
        }
                
        if let value = try values.decodeIfPresent(String.self, forKey: .name) {
            name = value
        }
        
        if let value = try values.decodeIfPresent(String.self, forKey: .site) {
            if value == "YouTube" {
                videoType = .youtube
            } else {
                videoType = .vimeo
            }
        }
    }
}
