//
//  JsonHandler+Videos.swift
//  ImdbMovies
//
//  Created by Rost on 20.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


extension JsonHandler {
    
    /// ---> Function for handle data of videos  <--- ///
    static func handleVideos(_ data: Data) -> AnyObject? {
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                if let videos = json["results"] as? [[String: AnyObject]] {
                    if videos.count > 0 {
                        guard let results = try? JSONSerialization.data(withJSONObject: videos,
                                                                        options: []) else {
                            return nil
                        }
                        
                        return results as AnyObject
                    } else {
                        return nil
                    }
                }
            }
        } catch let error as NSError {
            return error
        }
        
        return nil
    }
}
