//
//  CalendarMonthCollectionViewModel.swift
//  Events
//
//  Created by Lourdes on 6/24/21.
//

import UIKit

class CalendarMonthCollectionViewModel {
    let kIdentifier = String(describing: CalendarMonthCollectionView.self)
    let dateCellIdentifier = String(describing: CalendarDayCollectionViewCell.self)
    
    var selectedDate = Date().toLocalTime()
    var totalDays = [String]()
    
    private let cellPadding: CGFloat = 2
    private let numberOfCells: CGFloat = 8
    func getCellSizeForCollectionViewFrame(_ collecionViewFrame: CGRect) -> CGSize {
        let cellSizeLength = ((collecionViewFrame.width - cellPadding) / numberOfCells)
        return CGSize(width: cellSizeLength, height: cellSizeLength)
    }
}
