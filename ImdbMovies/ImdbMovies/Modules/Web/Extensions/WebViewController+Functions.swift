//
//  WebViewController+Functions.swift
//  ImdbMovies
//
//  Created by Rost on 20.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit

extension WebViewController {
        
    /// ---> Function for UI customisations  <--- ///
    func setupUI() {
        webView.navigationDelegate = self
    }
    
    
    /// ---> Function for load content to web view  <--- ///
    func loadContent() {
        activityIndicator.startAnimating()
        
        if let object = DataContainer.shared.videoObject {          // Load Video
            titleItem.title = "Video"
            
            if let request = RequestBuilder.makeContentRequest(object.videoKey, type: object.videoType) {
                webView.load(request)
            }
        } else if let page = DataContainer.shared.homepageUrl {     // Load the home page of movie
            titleItem.title = "Home page"
            
            if let request = RequestBuilder.makeContentRequest(page, type: .homepage) {
                webView.load(request)
            }
        }
    }

}
