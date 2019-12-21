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
    static func handleData(_ data: Data, type: EndpointsTypes) -> AnyObject {
        do {
            switch type {
            case .movies, .search:
                    if let results = handleMovies(data) as? Data {
                        let movies = try JSONDecoder().decode([MovieObject].self, from: results)
                        if movies.count > 0 {
                            return movies as AnyObject
                        } else {
                            return "The list of movies is empty. Try a different name." as AnyObject
                        }
                    } else {
                       return "The list of movies is empty." as AnyObject
                    }
                case .movieDetails:
                    let details = try JSONDecoder().decode(MovieDetailsObject.self, from: data)
  
                    return details as AnyObject
                case .videosList:
                    if let results = handleVideos(data) as? Data {
                        let videos = try JSONDecoder().decode([VideosObject].self, from: results)
                        if videos.count > 0 {
                            return videos as AnyObject
                        } else {
                            return "The list of videos is empty." as AnyObject
                        }
                    } else {
                       return "The list of videos is empty." as AnyObject
                    }
            }
        } catch let error {
            return error.localizedDescription as AnyObject
        }
    }
}
