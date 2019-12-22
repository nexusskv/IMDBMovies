//
//  GetMovies.swift
//  ImdbMovies
//
//  Created by Rost on 17.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class GetMovies {

    /// ---> Function for load data from API <--- ///
    static func loadList(_ page: Int, completion: ((_ response: AnyObject) -> Void)?) {
        if let request = RequestBuilder.makeRequest("\(page)", query: "", type: .movies) {
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
                    let result = JsonHandler.handleData(data, type: .movies)
                    
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
