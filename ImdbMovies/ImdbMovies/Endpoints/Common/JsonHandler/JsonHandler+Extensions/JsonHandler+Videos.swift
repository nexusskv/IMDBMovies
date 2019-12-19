//
//  JsonHandler+Videos.swift
//  ImdbMovies
//
//  Created by Rost on 20.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


extension JsonHandler {
    
    static func handleVideos(_ data: Data) -> AnyObject? {
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                if let value = json["results"] as? [[String: AnyObject]] {
                    guard let results = try? JSONSerialization.data(withJSONObject: value, options: []) else {
                        return nil
                    }
                    
                    return results as AnyObject
                }
            }
        } catch let error as NSError {
            return error
        }
        
        return nil
    }
}
