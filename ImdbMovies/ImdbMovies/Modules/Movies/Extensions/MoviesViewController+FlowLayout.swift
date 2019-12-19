//
//  MoviesViewController+FlowLayout.swift
//  ImdbMovies
//
//  Created by Rost on 18.12.2019.
//  Copyright © 2019 Rost Gress. All rights reserved.
//

import Foundation
import UIKit


extension MoviesViewController: UICollectionViewDelegateFlowLayout {

    /// ---> Function for set dynamically width and height of cell   <--- ///
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width / 2.0) - 10.0
        return CGSize(width: width, height: width + 50.0)
        //CGSize(width: 160.0, height: 230.0)
    }
    
    
    /// ---> Function for set cell indents   <--- ///
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }

    
    /// ---> Function for set section indent   <--- ///
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin * 2
    }

    
    /// ---> Function for set section insets   <--- ///
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: cellMargin * 2, left: cellMargin, bottom: cellMargin, right: cellMargin)
    }
}
