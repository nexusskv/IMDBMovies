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
    
    var allMovies: [MovieObject]?       // List of all movies
    
    var selectedMovieId: Int?           // movie id for download details
    var totalPages: Int?                // total pages for download
}
