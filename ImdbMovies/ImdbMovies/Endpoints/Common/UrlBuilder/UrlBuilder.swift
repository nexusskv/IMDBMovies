//
//  UrlBuilder.swift
//  ImdbMovies
//
//  Created by Rost on 19.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class UrlBuilder {

    /// ---> Function for make custom url to request <--- ///
    static func makeEndpointUrl(_ param: String, query: String, type: EndpointsTypes) -> String {
        var url = ""
        
        switch type {
            case .movies:
                url = listUrl + "?" + keyLangParam + "&" + pageParam + "=" + "\(param)"
            case .movieDetails:
                url = detailsUrl + "/" + param + "?" + keyLangParam
            case .videosList:
                url = detailsUrl + "/" + param + "/" + videosParam + "?" + keyLangParam
            case .search:
                url = apiUrl + "/" + searchParam + "?" + queryParam + "=" + query + "&" + keyLangPageParam + "=" + "\(param)"
        }
        
        return url
    }
    

    /// ---> Function for make session to request <--- ///
    static func makeSession() -> URLSession {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest    = TimeInterval(defaultTimeout)
        config.timeoutIntervalForResource   = TimeInterval(defaultTimeout * 2)
        
        let session = URLSession(configuration: config)
        
        return session
    }
}
