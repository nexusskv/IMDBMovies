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
    
           
    override func setUp() {
       let storyboard = UIStoryboard(name: "Web", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController
    }

    override func tearDown() {
        viewController = nil
        
        super.tearDown()
    }
    
    func testViewsAfterLoading() {
        XCTAssertNil(viewController.titleItem, "Before loading the navigation item should be nil")
        XCTAssertNil(viewController.webView, "Before loading the web view should be nil")

        let _ = viewController.view

        XCTAssertNotNil(viewController.titleItem, "The navigation item should be set")
        XCTAssertNotNil(viewController.webView, "The web view should be set")
    }
}
