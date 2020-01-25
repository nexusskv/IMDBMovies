//
//  VideosEndpointsManager.swift
//  ImdbMovies
//
//  Created by Rost on 25.01.2020.
//  Copyright © 2020 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class VideosEndpointsManager {
    
    /// ---> Function for download data source from server API <--- ///
    func loadVideos(_ view: VideosViewController) {
        if let value = DataContainer.shared.selectedDetailsId {
            view.activityIndicator.startAnimating()
            
            GetVideos.loadVideos(value, completion: { [weak self] result in
                guard let strongSelf = self else {
                  return
                }
                
                strongSelf.handleLoadedResult(view, result: result)
            })
        }
    }
    
    
    /// ---> Function for processing a received result  <--- ///
    func handleLoadedResult(_ view: VideosViewController, result: AnyObject) {
        view.activityIndicator.stopAnimating()
        
        if result is [VideosObject] {
            if let videos = result as? [VideosObject] {
                view.dataArray = videos

                view.videosTable.reloadData()
            } else {
                AlertPresenter.showAlert(view, message: "You received empty data.", completion: { flag in
                    Router.dismiss(view)
                })
            }
        } else if result is String {
            AlertPresenter.showAlert(view, message: result as! String, completion: { flag in
                Router.dismiss(view)
            })
        }
    }
}
