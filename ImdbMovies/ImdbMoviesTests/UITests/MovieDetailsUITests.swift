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
    
    /// ---> Function for set test view controller <--- ///
    override func setUp() {
       let storyboard = UIStoryboard(name: "MovieDetails", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController
    }

    
    /// ---> Function for destruct data <--- ///
    override func tearDown() {
        viewController = nil
        
        super.tearDown()
    }
    
    
    /// --->  Function for test exists views after loading  <--- ///
    func testTableViewAfterLoading() {
        XCTAssertNil(viewController.detailsTable,
                     "Before loading the table view should be nil.")
        
        XCTAssertNil(viewController.activityIndicator,
                     "Before loading the activity indicator should be nil.")

        let _ = viewController.view

        XCTAssertNotNil(viewController.detailsTable,
                        "The table view should be set.")
        
        XCTAssertNotNil(viewController.activityIndicator,
                        "The activity indicator should be set.")
        
        XCTAssertNotNil(viewController.detailsTable.dataSource,
                        "Table view data source isn't set.")
        
        XCTAssertNotNil(viewController.detailsTable.delegate,
                        "Table view delegate isn't set.")
    }
    
    
    /// --->  Function for check conform table view to delegate protocol  <--- ///
    func testConformsToTableViewDelegate() {
        XCTAssert(viewController.conforms(to: UITableViewDelegate.self),
                  "Table view not conform UITableViewDelegate.")
        
        XCTAssertTrue(viewController.responds(to: #selector(viewController.tableView(_:heightForRowAt:))),
                      "Table view not respond to heightForRowAt: selector.")
        
        XCTAssertTrue(viewController.responds(to: #selector(viewController.tableView(_:didSelectRowAt:))),
                      "Table view not respond to didSelectRowAt: selector.")
        
    }
    
    
    /// --->  Function for check conform table view to datasource protocol  <--- ///
    func testConformsToTableViewDataSource () {
        XCTAssert(viewController.conforms(to: UITableViewDataSource.self),
                  "Table view not conform UITableViewDataSource.")
        
        XCTAssertTrue(viewController.responds(to: #selector(viewController.tableView(_:cellForRowAt:))),
                      "Table view not respond to cellForRowAt: selector.")
        
        XCTAssertTrue(viewController.responds(to: #selector(viewController.tableView(_:numberOfRowsInSection:))),
                      "Table view not respond to numberOfRowsInSection: selector.")
    }
}
