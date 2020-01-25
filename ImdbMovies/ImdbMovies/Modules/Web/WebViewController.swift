//
//  WebViewController.swift
//  ImdbMovies
//
//  Created by Rost on 20.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit
import WebKit


class WebViewController: UIViewController {
    @IBOutlet weak var titleItem: UINavigationItem!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    var viewModel: WebViewModel!
    
    /// ---> View life cycle  <--- ///
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = WebViewModel()
        
        viewModel.setupUI(self)
    }
    
    
    /// ---> View life cycle  <--- ///
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.loadContent(self)
    }
    
    
    /// ---> View life cycle  <--- ///
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        DataContainer.shared.videoObject = nil
        DataContainer.shared.homepageUrl = nil
    }
}
