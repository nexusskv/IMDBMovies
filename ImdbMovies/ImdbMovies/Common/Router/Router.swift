//
//  Router.swift
//  ImdbMovies
//
//  Created by Rost on 18.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


class Router {

    /// ---> Function present some view controller from other view controller <--- ///
    static func present(_ vc: String, from parent: UIViewController) {
        let storyboard = UIStoryboard(name: vc, bundle: nil)
        let child = storyboard.instantiateViewController(withIdentifier: vc + "ViewController")
        parent.present(child, animated: true, completion: nil)
    }
    
    
    /// ---> Function remove some view controller from other view controller <--- ///
    static func dismiss(_ vc: UIViewController) {
        vc.dismiss(animated: true, completion: nil)
    }
}
