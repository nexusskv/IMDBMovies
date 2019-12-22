//
//  MoviesDataTests.swift
//  ImdbMoviesTests
//
//  Created by Rost on 21.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import XCTest
@testable import ImdbMovies

let testImageUrl    = "https://i.picsum.photos/id/237/200/300.jpg"


class MoviesDataTests: XCTestCase {
    var viewController: MoviesViewController!
    
    /// ---> Function for set test view controller <--- ///
    override func setUp() {
        let storyboard = UIStoryboard(name: "Movies", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "MoviesViewController") as? MoviesViewController
    }
    
    
    /// ---> Function for destruct data <--- ///
    override func tearDown() {
        viewController  = nil
        
        super.tearDown()
    }

    
    /// ---> Function for test movie object <--- ///
    func testMovieObject() {
        let testObject = makeTestObject()
                
        XCTAssertNotNil(testObject, "MovieObject is empty.")
    }
    
    
    /// ---> Function for test type of data array <--- ///
    func testTypeDataArray() {
        viewController.dataArray = [MovieObject]()
        
        XCTAssertNotNil(viewController.dataArray, "Data array have other type.")
    }
    
    
    /// ---> Function for check data array <--- ///
    func testDataArray() {
        let testObject = makeTestObject()
        
        viewController.dataArray.append(testObject)
        
        XCTAssertGreaterThanOrEqual(viewController.dataArray.count, 0, "Data array is empty.")
    }
    
    
    /// ---> Function for make test object <--- ///
    func makeTestObject() -> MovieObject {
        return MovieObject(objectId: 1,
                           voteCount: 5,
                           voteAvg: 5,
                           posterPath: testImageUrl,
                           iconPath: testImageUrl,
                           movieTitle: "TestName",
                           releaseDate: "01.01.2020",
                           overview: "Test overview.",
                           popularity: 100.0,
                           genreIds: [1, 10, 20])
    }
}
