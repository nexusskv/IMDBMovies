//
//  AlertPresenter.swift
//  ImdbMovies
//
//  Created by Rost on 17.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class AlertPresenter {
    
    /// ---> Function for show alerts <--- ///
    class func showAlert(_ vc: UIViewController, message: String) {
        DispatchQueue.main.async(execute: {
            let alert = UIAlertController(title: "Alert!", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            vc.present(alert, animated: true, completion:nil)
        })
    }
}
