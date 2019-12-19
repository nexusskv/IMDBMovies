//
//  Enums.swift
//  ImdbMovies
//
//  Created by Rost on 18.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


enum MoviesSortTypes: Int {
    case none = -1
    case dateAsc
    case dateDesc
    case titleAsc
    case titleDesc
    case popularAsc
    case popularDesc
    case voteCountAsc
    case voteCountDesc
    case voteAvgAsc
    case voteAvgDesc
    
    static let allMoviesSorts = [dateAsc.rawValue, dateDesc.rawValue, titleAsc.rawValue, titleDesc.rawValue, popularAsc.rawValue, popularDesc.rawValue, voteCountAsc.rawValue, voteCountDesc.rawValue, voteAvgAsc.rawValue, voteAvgDesc.rawValue]
}

enum ConfirmActionsTypes: Int {
    case ok = 0
    case cancel
}
