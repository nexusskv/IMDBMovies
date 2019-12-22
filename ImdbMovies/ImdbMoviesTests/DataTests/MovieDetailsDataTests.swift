//
//  MovieDetailsDataTests.swift
//  ImdbMoviesTests
//
//  Created by Rost on 22.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import XCTest
@testable import ImdbMovies


class MovieDetailsDataTests: XCTestCase {
    var viewController: MovieDetailsViewController!
    
    /// ---> Function for set test view controller <--- ///
    override func setUp() {
        let storyboard = UIStoryboard(name: "MovieDetails", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController
    }
    
    
    /// ---> Function for destruct data <--- ///
    override func tearDown() {
        viewController  = nil
        
        super.tearDown()
    }

    
    /// ---> Function for check test object <--- ///
    func testMovieObject() {
        viewController.detailsObject = makeTestObject()
        
        XCTAssertNotNil(viewController.detailsObject, "MovieDetailsObject is empty.")
    }
    
    
    /// ---> Function for make test object <--- ///
    func makeTestObject() -> MovieDetailsObject {
        return MovieDetailsObject(objectId: 1,
                                  imdbId: "TestId",
                                  posterPath: testImageUrl,
                                  iconPath: testImageUrl,
                                  budget: 1000000,
                                  homepage: "https://www.google.com",
                                  movieTitle: "TestTitle",
                                  overview: "TestOverview",
                                  popularity: 1.1,
                                  genres:   [GenreObject(objectId: 1, name: "TestGenre")],
                                  releaseDate: "01.01.2020",
                                  runtime: 90,
                                  tagline: "Test tag line.",
                                  voteCount: 5,
                                  voteAvg: 5)
    }
}
