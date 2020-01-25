//
//  MoviesViewController+CollectionView.swift
//  ImdbMovies
//
//  Created by Rost on 18.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MoviesViewController: UICollectionViewDataSource {
    
    /// ---> Fucntion of collection view data source protocol <--- ///
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    
    /// ---> Fucntion of collection view data source protocol <--- ///
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = viewModel.makeCell(collectionView, array: dataArray, index: indexPath)
               
        return cell
    }
    
    
    /// ---> Fucntion of collection view data source protocol <--- ///
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.loadNextPage(self, index: indexPath.row)
    }
}
