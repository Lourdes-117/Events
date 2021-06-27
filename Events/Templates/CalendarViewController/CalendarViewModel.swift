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
}
