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
    var dataArray: [VideosObject] = []
            
    /// ---> View life cycle  <--- ///
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadVideos()
    }
}
