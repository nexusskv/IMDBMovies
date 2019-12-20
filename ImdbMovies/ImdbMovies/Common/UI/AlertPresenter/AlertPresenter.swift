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
    static func showAlert(_ vc: UIViewController, message: String) {
        DispatchQueue.main.async(execute: {
            let alert = UIAlertController(title: "Alert!", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            vc.present(alert, animated: true, completion:nil)
        })
    }
    
    
    /// ---> Function for show alerts with handler <--- ///
    static func showAlert(_ vc: UIViewController, message: String, completion: ((_ flag: Bool) -> Void)?) {
        DispatchQueue.main.async(execute: {
            let alert = UIAlertController(title: "Alert!", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: { (action) -> Void in
                completion!(true)
            })
            
            alert.addAction(okAction)
            
            vc.present(alert, animated: true, completion:nil)
        })
    }
    
    
}
