//
//  WebUITests.swift
//  ImdbMoviesTests
//
//  Created by Rost on 21.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import XCTest
@testable import ImdbMovies


class WebUITests: XCTestCase {
    var viewController: WebViewController!
    
    /// ---> Function for set test view controller <--- ///
    override func setUp() {
       let storyboard = UIStoryboard(name: "Web", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController
    }
    
    
    /// ---> Function for destruct data <--- ///
    override func tearDown() {
        viewController = nil
        
        super.tearDown()
    }
    
    
    /// --->  Function for test exists views after loading  <--- ///
    func testViewsAfterLoading() {
        XCTAssertNil(viewController.titleItem, "Before loading the navigation item should be nil.")
        
        XCTAssertNil(viewController.webView, "Before loading the web view should be nil.")
        
        XCTAssertNil(viewController.activityIndicator, "Before loading the activity indicator should be nil.")

        let _ = viewController.view

        XCTAssertNotNil(viewController.titleItem, "The navigation item should be set.")
        
        XCTAssertNotNil(viewController.webView, "The web view should be set.")
        
        XCTAssertNotNil(viewController.activityIndicator, "The activity indicator should be set.")
    }
}
