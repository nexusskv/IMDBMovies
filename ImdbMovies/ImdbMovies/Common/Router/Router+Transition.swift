//
//  Router+Transition.swift
//  ImdbMovies
//
//  Created by Rost on 20.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension Router {
    
    static func makeTransition(_ type: TransitionType) -> CATransition {
        let transition              = CATransition()
        transition.duration         = 0.45
        transition.type             = .push
        transition.timingFunction   = CAMediaTimingFunction(name: .easeInEaseOut)
        
        switch type {
            case .push:
                transition.subtype  = .fromRight
            case .pop:
                transition.subtype  = .fromLeft
        }
        
        return transition
    }
}
