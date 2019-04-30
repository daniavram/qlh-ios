//
//  Day.swift
//  qlh-ios
//
//  Created by Daniel Avram on 30/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

enum Day: String, Comparable {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday

    var order: Int {
        switch self {
        case .monday: return 1
        case .tuesday: return 2
        case .wednesday: return 3
        case .thursday: return 4
        case .friday: return 5
        case .saturday: return 6
        case .sunday: return 7
        }
    }

    static func < (lhs: Day, rhs: Day) -> Bool {
        return lhs.order < rhs.order
    }
}
