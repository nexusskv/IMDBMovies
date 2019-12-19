//
//  UrlBuilder.swift
//  ImdbMovies
//
//  Created by Rost on 19.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class UrlBuilder {
    
    static func makeRequest(_ param: String, type: EndpointsUrls) -> URLRequest? {
        let url = makeEndpointUrl(param, type: type)
               
        guard let resultUrl = URL(string: url) else {
            print("Error: can't create URL")
            return nil
        }

        let urlRequest = URLRequest(url: resultUrl)
        
        return urlRequest
    }
    
    static func makeEndpointUrl(_ param: String, type: EndpointsUrls) -> String {
        var url = ""
        
        switch type {
            case .movies:
                url = listUrl + "?" + keyLangParam + "&" + pageParam + "=" + "\(param)"
            case .movieDetails:
                url = detailsUrl + "/" + param + "?" + keyLangParam
            case .videosList:
                url = detailsUrl + "/" + param + "/" + videosParam + "?" + keyLangParam
        }
        
        return url
    }
    
    static func makeVideoUrl(_ param: String, type: VideoTypes) -> String {
        var url = ""
        
        switch type {
            case .youtube:
                url = youtubeUrl + "=" + param
            case .vimeo:
                url = vimeoUrl + "/" + param
        }
        
        return url
    }
        
    
    static func makeSession() -> URLSession {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        return session
    }
}
