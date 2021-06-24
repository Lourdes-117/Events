//
//  DateUtilities.swift
//  Events
//
//  Created by Lourdes on 6/25/21.
//

import UIKit

enum StartDayOfWeek: Int {
    case saturday = 0
    case sunday = 1
    case monday = 2
}

extension Date {
    var nextMonth: Date? {
        return Calendar.current.date(byAdding: .month, value: 1, to: self)
    }
    
    var previousMonth: Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }
    
    var monthString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = StringConstants.shared.dateFormatter.monthStringDateFormatter
        return dateFormatter.string(from: self)
    }
    
    var yearString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = StringConstants.shared.dateFormatter.yearStringDateFormatter
        return dateFormatter.string(from: self)
    }
    
    var daysInMonth: Int? {
        let days = Calendar.current.range(of: .day, in: .month, for: self)
        return days?.count
    }
    
    var dayOfMonth: Int? {
        let components = Calendar.current.dateComponents([.day], from: self)
        return components.day
    }
    
    var firstDayOfMonth: Date? {
        let components = Calendar.current.dateComponents([.year, .month, .weekday], from: self)
        return Calendar.current.date(from: components)?.toLocalTime()
    }
    
    var daysBeforeFirstDayOfMonth: Int? {
        let firstDate = (firstDayOfMonth?.weekDay ?? 1) - StartDayOfWeek.monday.rawValue
        let daysInWeek = 7
        return firstDate > 0 ? firstDate : daysInWeek + firstDate
    }
    
    var weekDay: Int? {
        let components = Calendar.current.dateComponents([.weekday], from: self)
        return components.weekday
    }
    
    func toLocalTime() -> Date {
        let timezoneOffset = TimeZone.current.secondsFromGMT()
        let epochDate = self.timeIntervalSince1970
        let timezoneEpochOffset = (epochDate + Double(timezoneOffset))
        return Date(timeIntervalSince1970: timezoneEpochOffset)
    }
}
