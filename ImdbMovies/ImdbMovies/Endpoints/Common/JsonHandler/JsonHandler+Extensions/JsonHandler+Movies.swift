//
//  JsonHandler+Movies.swift
//  ImdbMovies
//
//  Created by Rost on 19.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


extension JsonHandler {
    
    static func handleMovies(_ data: Data) -> AnyObject? {
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                if let total = json["total_pages"] as? Int {
                    DataContainer.shared.totalPages = total // Save total to container for check on pagination
                }
                
                let movies = json["results"] as! [AnyObject]
                
                var verifiedMovies: [[String: AnyObject]] = []
                for movie in movies {
                    if !movie.isEqual(NSNull()) {
                        verifiedMovies.append(movie as! [String : AnyObject])
                    }
                }
                
                guard let results = try? JSONSerialization.data(withJSONObject: verifiedMovies, options: []) else {
                    return nil
                }
                
                return results as AnyObject

            }
        } catch let error as NSError {
            return error
        }
        
        return nil
    }
}
