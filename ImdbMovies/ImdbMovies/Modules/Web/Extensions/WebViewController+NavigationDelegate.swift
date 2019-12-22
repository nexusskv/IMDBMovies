//
//  WebViewController+NavigationDelegate.swift
//  ImdbMovies
//
//  Created by Rost on 22.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit
import WebKit


extension WebViewController: WKNavigationDelegate {
    
    /// ---> Function of navigation delegate protocol <--- ///
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
}
