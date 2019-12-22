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
    
    /// ---> Function for set test view controller <--- ///
    override func setUp() {
       let storyboard = UIStoryboard(name: "Movies", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "MoviesViewController") as? MoviesViewController
    }

    
    /// ---> Function for destruct data <--- ///
    override func tearDown() {
        viewController = nil
        
        super.tearDown()
    }
    
    
    /// --->  Function for test exists views after loading  <--- ///
    func testViewsAfterLoading() {
        XCTAssertNil(viewController.moviesView,
                     "Before loading the collection view should be nil.")
        
        XCTAssertNil(viewController.sortView,
                     "Before loading the sort view should be nil.")
                        
        XCTAssertNil(viewController.searchView,
                     "Before loading the search view should be nil.")
        
        XCTAssertNil(viewController.searchBar,
                     "Before loading the search view should be nil.")
        
        XCTAssertNil(viewController.activityIndicator,
                     "Before loading the activity indicator should be nil.")
        
        let _ = viewController.view

        XCTAssertNotNil(viewController.moviesView,
                        "The collection view should be set.")
        
        XCTAssertNotNil(viewController.sortView,
                        "The sort view should be set.")
        
        XCTAssertNotNil(viewController.searchView,
                        "The search view should be set.")
        
        XCTAssertNotNil(viewController.searchBar,
                        "The search bar should be set.")
        
        XCTAssertNotNil(viewController.activityIndicator,
                        "The activity indicator should be set.")
                
        XCTAssertNotNil(viewController.moviesView.dataSource,
                            "Collection view data source isn't set.")

        XCTAssertNotNil(viewController.moviesView.delegate,
                            "Collection view delegate isn't set.")
        
        XCTAssertNotNil(viewController.searchBar.delegate,
                        "Search bar delegate isn't set.")
    }
    
    
    /// --->  Function for check conform collection view to delegate protocol  <--- ///
    func testConformsToCollectionViewDelegate() {
        XCTAssert(viewController.conforms(to: UICollectionViewDelegate.self),
                  "Collection view not conform to UICollectionViewDelegate.")
        
        XCTAssertTrue(viewController.responds(to: #selector(viewController.collectionView(_:willDisplay:forItemAt:))),
                      "Collection view not respond to willDisplay:forItemAt: selector.")
    }
    
    
    /// --->  Function for check conform collection view to flow layout delegate protocol  <--- ///
    func testConformsToCollectionViewDelegateFlowLayout () {
        XCTAssert(viewController.conforms(to: UICollectionViewDelegateFlowLayout.self),
                  "Collection view not conform to UICollectionViewDelegateFlowLayout.")
        
        XCTAssertTrue(viewController.responds(to: #selector(viewController.collectionView(_:layout:sizeForItemAt:))),
                      "Collection view not respond to layout:sizeForItemAt: selector.")
        
        XCTAssertTrue(viewController.responds(to: #selector(viewController.collectionView(_:layout:insetForSectionAt:))),
                      "Collection view not respond to layout:insetForSectionAt: selector.")
        
        XCTAssertTrue(viewController.responds(to: #selector(viewController.collectionView(_:layout:minimumInteritemSpacingForSectionAt:))),
                      "Collection view not respond to layout:minimumInteritemSpacingForSectionAt: selector.")
        
        XCTAssertTrue(viewController.responds(to: #selector(viewController.collectionView(_:layout:minimumLineSpacingForSectionAt:))),
                      "Collection view not respond to layout:minimumLineSpacingForSectionAt: selector.")
    }
    
    
    /// --->  Function for check conform search bar to delegate protocol  <--- ///
    func testConformsToSearchBarDelegateProtocol() {
        XCTAssert(viewController.conforms(to: UISearchBarDelegate.self),
                  "Search bar not conform to UISearchBarDelegate.")
        
        XCTAssertTrue(viewController.responds(to: #selector(viewController.searchBarTextDidBeginEditing(_:))),
                      "Search bar not respond to searchBarTextDidBeginEditing selector.")
        
        XCTAssertTrue(viewController.responds(to: #selector(viewController.searchBarSearchButtonClicked(_:))),
                      "Search bar not respond to searchBarSearchButtonClicked selector.")
        
        XCTAssertTrue(viewController.responds(to: #selector(viewController.searchBarCancelButtonClicked(_:))),
                      "Search bar not respond to searchBarCancelButtonClicked selector.")
        
        XCTAssertTrue(viewController.responds(to: #selector(viewController.searchBar(_:textDidChange:))),
                      "Search bar not respond to searchBar:textDidChange: selector.")
    }
}
