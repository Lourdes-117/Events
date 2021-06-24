//
//  StringConstants.swift
//  Events
//
//  Created by Lourdes on 6/25/21.
//

import Foundation

struct StringConstants {
    static let shared = StringConstants()
    
    let dateFormatter = DateFormatterConstants()
}

struct DateFormatterConstants {
    let monthStringDateFormatter = "LLLL"
    let yearStringDateFormatter = "yyyy"
}

