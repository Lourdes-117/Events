//
//  CalendarViewModel.swift
//  Events
//
//  Created by Lourdes on 6/25/21.
//

import UIKit

class CalendarViewModel {
    var currentDate = Date()
    var previousIndex = 0
    
    let calendarTableViewCellIdentifier = String(describing: CalendarMonthTableViewCell.self)
    
    func getTableViewCellHeightForWidth(_ width: CGFloat, date: Date) -> CGFloat {
        let collectionViewCellPadding: CGFloat = 2
        let numberOfCells: CGFloat = 7
        let cellWidth = ((width - collectionViewCellPadding) / numberOfCells)
        let toalDayCount = (date.daysBeforeFirstDayOfMonth ?? 0) + (date.daysInMonth ?? 0)
        let numberOfCellsInARow: CGFloat = 7
        let numberOfRows = (CGFloat(toalDayCount) / numberOfCellsInARow).rounded(.up)
        let collectionViewHeight = numberOfRows * cellWidth
        let collectionViewTopSpace = 25
        return collectionViewHeight + CGFloat(collectionViewTopSpace)
    }
}
