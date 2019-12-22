//
//  Enums.swift
//  ImdbMovies
//
//  Created by Rost on 18.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


/// ---> Types of transitions for view controller actions <--- ///
enum TransitionType: Int {
    case push = 0
    case pop
}


/// ---> Types of content for web view  <--- ///
enum WebTypes: Int {
    case youtube = 0
    case vimeo
    case homepage
}


/// ---> Types of endpoints for requests to API  <--- ///
enum EndpointsTypes: Int {
    case movies = 0
    case movieDetails
    case videosList
    case search
}


/// ---> Types of sort movies  <--- ///
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


/// ---> Types of actions for confirm buttons  <--- ///
enum ConfirmActionsTypes: Int {
    case ok = 0
    case cancel
}


/// ---> Types of cells for details table  <--- ///
enum DetailsTableCells: Int {
    case poster = 0
    case title
    case rating
    case tagline
    case genres
    case overview
    case video
    case homepage
    
    /// ---> Function for get heights to cells in details table  <--- ///
    func getHeight() -> CGFloat {
        switch self {
            case .poster:
                return 242.0
            case .title:
                return 52.0
            case .rating:
                return 92.0
            case .tagline:
                return 50.0
            case .genres:
                return 68.0
            case .overview:
                return 160.0
            case .video, .homepage:
                return 60.0                
        }
    }
    
    
    /// ---> Function for get types of classes in details table  <--- ///
    func getClass() -> BaseDetailsCell.Type {
        switch self {
            case .poster:
                return PosterCell.self
            case .title:
                return TitleCell.self
            case .rating:
                return RatingCell.self
            case .tagline:
                return TaglineCell.self
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
    
    
    /// ---> Function for get class identifier in details table  <--- ///
    func getName() -> String {
        switch self {
            case .poster:
                return "PosterCell"
            case .title:
                return "TitleCell"
            case .rating:
                return "RatingCell"
            case .tagline:
                return "TaglineCell"
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
    
    
    /// ---> Function for get all cell types in details table  <--- ///
    static func getCellTypes() -> [DetailsTableCells] {
        return [.poster, .title, .rating, .tagline, .genres, .overview, .video, .homepage]
    }
}
