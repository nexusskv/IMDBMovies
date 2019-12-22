//
//  WebDataTests.swift
//  ImdbMoviesTests
//
//  Created by Rost on 22.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import XCTest
@testable import ImdbMovies


class WebDataTests: XCTestCase {
        
    /// ---> Function for test type of data array <--- ///
    func testVideoObject() {
        DataContainer.shared.videoObject = makeTestObject()
                
        XCTAssertNotNil(DataContainer.shared.videoObject, "Video object is empty.")
    }
    
    
    /// ---> Function for check data array <--- ///
    func testHomePageUrl() {
        DataContainer.shared.homepageUrl = "https://www.google.com"
        
        XCTAssertNotNil(DataContainer.shared.homepageUrl, "Home page url is empty.")
    }
    
    
    /// ---> Function for make test object <--- ///
    func makeTestObject() -> VideosObject {
        return VideosObject(objectId: "TestId",
                            videoKey: testVideoKey,
                            name: "TestVideo",
                            videoType: .youtube)
    }
}
