//
//  AsyncImageView.swift
//  ImdbMovies
//
//  Created by Rost on 17.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


var asyncImagesCashArray = NSCache<NSString, UIImage>()


class AsyncImageView: UIImageView {
    private var currentURL: NSString?

    /// ---> Function for download image asyncronously <--- ///
    func loadAsync(_ url: String, placeholder: UIImage?) {
        let imgUrl = url as NSString
        if let cashedImage = asyncImagesCashArray.object(forKey: imgUrl) {
            image = cashedImage
            return
        }
        
        image = placeholder
        currentURL = imgUrl
        
        guard let requestURL = URL(string: url) else { image = placeholder; return }
        
        URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            DispatchQueue.main.async { [weak self] in
                if error == nil {
                    if let imageData = data {
                        if self?.currentURL == imgUrl {
                            if let imageToPresent = UIImage(data: imageData) {
                                asyncImagesCashArray.setObject(imageToPresent, forKey: imgUrl)
                                self?.image = imageToPresent
                            } else {
                                self?.image = placeholder!
                            }
                        }
                    } else {
                        self?.image = placeholder
                    }
                } else {
                    self?.image = placeholder
                }
            }
        }.resume()
    }
}
