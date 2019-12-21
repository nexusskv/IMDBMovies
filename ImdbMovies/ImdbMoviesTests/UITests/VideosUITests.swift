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
        
        super.tearDown()
    }
    
    func testTableViewAfterLoading() {
        XCTAssertNil(viewController.videosTable,
                     "Before loading the table view should be nil")

        let _ = viewController.view

        XCTAssertNotNil(viewController.videosTable,
                        "The table view should be set")
        
        XCTAssertNotNil(viewController.videosTable.dataSource,
                        "Table view data source isn't set.")
        
        XCTAssertNotNil(viewController.videosTable.delegate,
                        "Table view delegate isn't set.")
    }
    
    func testConformsToTableViewDelegate() {
        XCTAssert(viewController.conforms(to: UITableViewDelegate.self),
                  "Table view not conform UITableViewDelegate.")
        
        XCTAssertTrue(viewController.responds(to: #selector(viewController.tableView(_:heightForRowAt:))),
                      "Table view not respond to heightForRowAt: selector.")
        
        XCTAssertTrue(viewController.responds(to: #selector(viewController.tableView(_:didSelectRowAt:))),
                      "Table view not respond to didSelectRowAt: selector.")
        
    }
    
    func testConformsToTableViewDataSource () {
        XCTAssert(viewController.conforms(to: UITableViewDataSource.self),
                  "Table view not conform UITableViewDataSource.")
        
        XCTAssertTrue(viewController.responds(to: #selector(viewController.tableView(_:cellForRowAt:))),
                      "Table view not respond to cellForRowAt: selector.")
        
        XCTAssertTrue(viewController.responds(to: #selector(viewController.tableView(_:numberOfRowsInSection:))),
                      "Table view not respond to numberOfRowsInSection: selector.")
    }
}
