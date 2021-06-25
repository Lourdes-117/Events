//
//  CalendarDayCollectionViewModel.swift
//  Events
//
//  Created by Lourdes on 6/26/21.
//

import Foundation

class CalendarDayCollectionViewModel {
    func getMonthStringTitle(_ dayNumber: String,_ date: Date) -> String? {
        if dayNumber == "1" {
            return date.monthShortName
        }
        return nil
    }
}
