//
//  Course.swift
//  qlh-ios
//
//  Created by Daniel Avram on 25/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

class Course: Codable {
    var name: String?
    var price: String?
    
    enum Key: String, CodingKey {
        case name
        case price
    }
}
