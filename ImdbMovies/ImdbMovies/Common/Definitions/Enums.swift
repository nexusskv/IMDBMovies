//
//  Enums.swift
//  ImdbMovies
//
//  Created by Rost on 18.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


enum VideoTypes: Int {
    case youtube = 0
    case vimeo
}

enum EndpointsUrls: Int {
    case movies = 0
    case movieDetails
    case videosList
}

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

enum DetailsTableCells: Int {
    case poster = 0
    case title
    case rating
    case genres
    case overview
    case video
    case homepage
    
    func getHeight() -> CGFloat {
        switch self {
            case .poster:
                return 242.0
            case .title:
                return 52.0
            case .rating, .video, .homepage:
                return 60.0
            case .genres:
                return 68.0
            case .overview:
                return 160.0
                
        }
    }
    
    func getPosterType() -> PosterCell.Type {
        return PosterCell.self
    }
    
    func getClass() -> BaseTableCell.Type {
        switch self {
            case .poster:
                return PosterCell.self
            case .title:
                return TitleCell.self
            case .rating:
                return RatingCell.self
            case .genres:
                return GenresCell.self
            case . overview:
                return OverviewCell.self
            case .video:
                return VideoCell.self
            case .homepage:
                return HomepageCell.self
        }
    }
    
    func getName() -> String {
        switch self {
            case .poster:
                return "PosterCell"
            case .title:
                return "TitleCell"
            case .rating:
                return "RatingCell"
            case .genres:
                return "GenresCell"
            case . overview:
                return "OverviewCell"
            case .video:
                return "VideoCell"
            case .homepage:
                return "HomepageCell"
        }
    }
    
    static func getCellTypes() -> [DetailsTableCells] {
        return [.poster, .title, .rating, .genres, .overview, .video, .homepage]
    }
}
