//
//  RequestBuilder.swift
//  ImdbMovies
//
//  Created by Rost on 22.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class RequestBuilder {
    
    /// ---> Function for make custom request to API <--- ///
    static func makeRequest(_ param: String, query: String, type: EndpointsTypes) -> URLRequest? {
        let url = UrlBuilder.makeEndpointUrl(param, query: query, type: type)
               
        guard let resultUrl = URL(string: url) else {
            print("Error: can't create endpoint URL")
            return nil
        }

        let urlRequest = URLRequest(url: resultUrl)
        
        return urlRequest
    }
    
    
    /// ---> Function for make custom request to web services <--- ///
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
}
