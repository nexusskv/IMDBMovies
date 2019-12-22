//
//  GetVideos.swift
//  ImdbMovies
//
//  Created by Rost on 20.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class GetVideos {

    /// ---> Function for load data from API <--- ///
    static func loadVideos(_ value: Int, completion: ((_ response: AnyObject) -> Void)?) {
        if let request = RequestBuilder.makeRequest("\(value)", query: "", type: .videosList) {
            let session = UrlBuilder.makeSession()
            
            let task = session.dataTask(with: request,
                                        completionHandler: { (data, response, error) in
                guard let data = data, error == nil else {
                    DispatchQueue.main.async {
                        completion!(error?.localizedDescription as AnyObject)
                    }
                    
                    return
                }
                
                DispatchQueue.global(qos: .userInitiated).async {
                    let result = JsonHandler.handleData(data, type: .videosList)
                    
                    DispatchQueue.main.async {
                        completion!(result as AnyObject)
                    }
                }
            })
            
            task.resume()
        } else {
            completion!("Error: can't create URL." as AnyObject)
        }
    }
}
