//
//  JsonHandler.swift
//  ImdbMovies
//
//  Created by Rost on 17.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class JsonHandler {
    
    /// ---> Function for handle received data <--- ///
    static func handleData(_ data: Data) -> AnyObject {
        do {
            if let results = handleMovies(data) as? Data {
                let movies = try JSONDecoder().decode([MovieObject].self, from: results)
                
                if movies.count > 0 {
                    return movies as AnyObject
                } else {
                    return "Serialization error from results" as AnyObject
                }
            } else {
               return "Serialization error in get results" as AnyObject
            }
        } catch let error {
            return error.localizedDescription as AnyObject
        }
    }
    
    static func handleMovies(_ data: Data) -> AnyObject? {
        do {
            // make sure this JSON is in the format we expect
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                // try to read out a string array
                if let value = json["results"] as? [[String: AnyObject]] {
                    guard let results = try? JSONSerialization.data(withJSONObject: value, options: []) else {
                        return nil
                    }
                    
                    return results as AnyObject
                }
                
                if let total = json["total_pages"] as? Int {
                    DataContainer.shared.totalPages = total     // Save total to container for check before download
                }
            }
        } catch let error as NSError {
            return error
        }
        
        return nil
    }
}
