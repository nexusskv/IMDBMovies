//
//  VideosDataTests.swift
//  ImdbMoviesTests
//
//  Created by Rost on 22.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import XCTest
@testable import ImdbMovies

let testVideoKey = "VfLf7A_-1Vw"


class VideosDataTests: XCTestCase {
    var viewController: VideosViewController!
    
    /// ---> Function for set test view controller <--- ///
    override func setUp() {
        let storyboard = UIStoryboard(name: "Videos", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "VideosViewController") as? VideosViewController
    }
    
    
    /// ---> Function for destruct data <--- ///
    override func tearDown() {
        viewController  = nil
        
        super.tearDown()
    }
    
    
    /// ---> Function for check test object <--- ///
    func testMovieObject() {
        let testObject = makeTestObject()
        
        XCTAssertNotNil(testObject, "VideosObject is empty.")
    }
    
    
    /// ---> Function for test type of data array <--- ///
    func testTypeDataArray() {
        viewController.dataArray = [VideosObject]()
        
        XCTAssertNotNil(viewController.dataArray, "Data array is empty.")
    }
    
    
    /// ---> Function for check data array <--- ///
    func testDataArray() {
        let testObject = makeTestObject()
        
        viewController.dataArray.append(testObject)
        
        XCTAssertGreaterThanOrEqual(viewController.dataArray.count, 0, "Data array is empty.")
    }
    
    
    /// ---> Function for make test object <--- ///
    func makeTestObject() -> VideosObject {
        return VideosObject(objectId: "TestId",
                            videoKey: testVideoKey,
                            name: "TestVideo",
                            videoType: .youtube)
    }
}

