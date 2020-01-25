//
//  WebViewModel.swift
//  ImdbMovies
//
//  Created by Rost on 25.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class WebViewModel {
    
    /// ---> Function for UI customisations  <--- ///
    func setupUI(_ view: WebViewController) {
        view.webView.navigationDelegate = view
    }
    
    
    /// ---> Function for load content to web view  <--- ///
    func loadContent(_ view: WebViewController) {
        view.activityIndicator.startAnimating()
        
        if let object = DataContainer.shared.videoObject {          // Load Video
            view.titleItem.title = "Video"
            
            if let request = RequestBuilder.makeContentRequest(object.videoKey, type: object.videoType) {
                view.webView.load(request)
            }
        } else if let page = DataContainer.shared.homepageUrl {     // Load the home page of movie
            view.titleItem.title = "Home page"
            
            if let request = RequestBuilder.makeContentRequest(page, type: .homepage) {
                view.webView.load(request)
            }
        }
    }
}
