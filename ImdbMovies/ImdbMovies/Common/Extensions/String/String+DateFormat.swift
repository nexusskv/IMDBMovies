//
//  String+DateFormat.swift
//  ImdbMovies
//
//  Created by Rost on 19.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation


extension String {
    
    
    /// ---> Function for format date to full date format <--- ///
    func formatDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat    = "yyyy-MM-dd"
        dateFormatter.timeZone      = TimeZone.current
        dateFormatter.locale        = Locale.current
        
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            
            return dateFormatter.string(from: date)
        }
        
        return nil
    }
}
