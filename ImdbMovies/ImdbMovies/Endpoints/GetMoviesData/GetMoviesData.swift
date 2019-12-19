//
//  GetMoviesData.swift
//  ImdbMovies
//
//  Created by Rost on 17.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


class GetMoviesData {

    /// ---> Function for load data from API <--- ///
    static func loadList(_ page: Int, completion: ((_ response: AnyObject) -> Void)?) {
        let url = listUrl + "?" + apiKeyParam + "&" + langParam + "&" + pageParam + "=" + "\(page)"

        guard let resultUrl = URL(string: url) else {
            DispatchQueue.main.async {
                completion!("Error: can't create URL" as AnyObject)
            }
            return
        }
        
        let urlRequest = URLRequest(url: resultUrl)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion!(error?.localizedDescription as AnyObject)
                }
                return
            }
            
            DispatchQueue.global(qos: .userInitiated).async {
                let result = JsonHandler.handleData(data)
                
                DispatchQueue.main.async {
                    completion!(result as AnyObject)
                }
            }
        })
        
        task.resume()
    }
}
