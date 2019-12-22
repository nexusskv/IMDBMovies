//
//  DataContainer.swift
//  ImdbMovies
//
//  Created by Rost on 18.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class DataContainer {
    static let shared = DataContainer()
    private init() { }
    
    var allMovies: [MovieObject]?                           // List of all movies
    
    var selectedSortType: MoviesSortTypes = .none           // current type of sort movies
    
    var selectedMovieId: Int?                               // movie id for download details
    var totalPages: Int?                                    // total pages for download
    
    var selectedDetailsId: Int?                             // movie id for download list of videos
    
    var homepageUrl: String?                                // string url for show home page
    var videoObject: VideosObject?                          // object for show video on web page
    
    var searchQuery: String?                                // String for search movies on API
}
