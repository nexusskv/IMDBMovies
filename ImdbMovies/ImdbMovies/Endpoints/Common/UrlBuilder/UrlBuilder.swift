//
//  UrlBuilder.swift
//  ImdbMovies
//
//  Created by Rost on 19.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class UrlBuilder {
    
    static func makeRequest(_ param: String, query: String, type: EndpointsTypes) -> URLRequest? {
        let url = makeEndpointUrl(param, query: query, type: type)
               
        guard let resultUrl = URL(string: url) else {
            print("Error: can't create endpoint URL")
            return nil
        }

        let urlRequest = URLRequest(url: resultUrl)
        
        return urlRequest
    }
    
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
    
    static func makeContentRequest(_ param: String, type: WebTypes) -> URLRequest? {
        var url = ""
        
        switch type {
            case .youtube:
                url = youtubeUrl + "=" + param
            case .vimeo:
                url = vimeoUrl + "/" + param
            case .homepage:
                url = param
        }
        
        guard let resultUrl = URL(string: url) else {
            print("Error: can't create content URL")
            return nil
        }

        let urlRequest = URLRequest(url: resultUrl)
        
        return urlRequest
    }
        
    
    static func makeSession() -> URLSession {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        return session
    }
}
