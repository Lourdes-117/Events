//
//  CalendarMonthCollectionViewModel.swift
//  Events
//
//  Created by Lourdes on 6/24/21.
//

import UIKit

protocol CalendarSelectionDelegate: AnyObject {
    func didSelectDate(_ date: Date)
}

class CalendarMonthCollectionViewModel {
    let kIdentifier = String(describing: CalendarMonthCollectionView.self)
    let dateCellIdentifier = String(describing: CalendarDayCollectionViewCell.self)
    
    var selectedDate = Date().toLocalTime()
    var totalDays = [String]()
    
    private let cellPadding: CGFloat = 2
    private let numberOfCells: CGFloat = 7
    func getCellSizeForCollectionViewWidth(_ collecionViewWidth: CGFloat) -> CGSize {
        let cellWidth = ((collecionViewWidth - cellPadding) / numberOfCells)
        let cellHeight = cellWidth
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
