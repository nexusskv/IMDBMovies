//
//  VideosViewController.swift
//  ImdbMovies
//
//  Created by Rost on 18.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class VideosViewController: UIViewController {
    @IBOutlet weak var videosTable: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var dataArray: [VideosObject] = []
    var viewModel: VideosViewModel!
    var endpointsManager: VideosEndpointsManager!
    
    /// ---> View life cycle  <--- ///
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel           =  VideosViewModel()
        endpointsManager    =  VideosEndpointsManager()
        
        viewModel.setupUI(self)
    }

    
    /// ---> View life cycle  <--- ///
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        endpointsManager.loadVideos(self)
    }
}
