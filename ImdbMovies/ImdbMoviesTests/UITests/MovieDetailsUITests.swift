//
//  MovieDetailsUITests.swift
//  ImdbMoviesTests
//
//  Created by Rost on 21.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import XCTest
@testable import ImdbMovies

class MovieDetailsUITests: XCTestCase {
    var viewController: MovieDetailsViewController!
    
           
    override func setUp() {
       let storyboard = UIStoryboard(name: "MovieDetails", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController
    }

    override func tearDown() {
        viewController = nil
    }
    
    func testTableViewAfterLoading() {
        XCTAssertNil(viewController.detailsTable, "Before loading the table view should be nil")

        let _ = viewController.view

        XCTAssertNotNil(viewController.detailsTable, "The table view should be set")
    }
}
