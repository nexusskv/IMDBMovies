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

    /// ---> Function for show some view controller from other view controller <--- ///
    static func present(_ vc: String, from parent: UIViewController) {
        let storyboard = UIStoryboard(name: vc, bundle: nil)
        let child = storyboard.instantiateViewController(withIdentifier: vc + "ViewController")
        child.modalPresentationStyle = .fullScreen
        
        let transition = makeTransition(.push)
        parent.view.window!.layer.add(transition, forKey: kCATransition)
        
        parent.present(child, animated: false, completion: nil)
    }
    
    
    /// ---> Function for close some view controller from other view controller <--- ///
    static func dismiss(_ vc: UIViewController) {
        let transition = makeTransition(.pop)
        vc.view.window!.layer.add(transition, forKey: kCATransition)
        
        vc.dismiss(animated: false, completion: nil)
    }
}
