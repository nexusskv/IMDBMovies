//
//  VideosUITests.swift
//  ImdbMoviesTests
//
//  Created by Rost on 21.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import XCTest
@testable import ImdbMovies

class VideosUITests: XCTestCase {
    var viewController: VideosViewController!
    
           
    override func setUp() {
       let storyboard = UIStoryboard(name: "Videos", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "VideosViewController") as? VideosViewController
    }

    override func tearDown() {
        viewController = nil
    }
    
    func testTableViewAfterLoading() {
        XCTAssertNil(viewController.videosTable, "Before loading the table view should be nil")

        let _ = viewController.view

        XCTAssertNotNil(viewController.videosTable, "The table view should be set")
    }
}
