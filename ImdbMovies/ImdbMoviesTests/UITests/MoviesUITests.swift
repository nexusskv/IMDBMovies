//
//  MoviesUITests.swift
//  ImdbMoviesTests
//
//  Created by Rost on 21.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import XCTest
@testable import ImdbMovies

class MoviesUITests: XCTestCase {
    var viewController: MoviesViewController!
    
           
    override func setUp() {
       let storyboard = UIStoryboard(name: "Movies", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "MoviesViewController") as? MoviesViewController
    }

    override func tearDown() {
        viewController = nil
    }
    
    func testCollectionViewAfterLoading() {
        XCTAssertNil(viewController.sortView, "Before loading the sort view should be nil")
        XCTAssertNil(viewController.moviesView, "Before loading the collection view should be nil")

        let _ = viewController.view

        XCTAssertNotNil(viewController.moviesView, "The collection view should be set")
        XCTAssertNotNil(viewController.sortView, "The sort view should be set")
    }
}

