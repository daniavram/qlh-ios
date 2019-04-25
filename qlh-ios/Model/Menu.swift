//
//  Menu.swift
//  qlh-ios
//
//  Created by Daniel Avram on 25/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

class Menu: Codable {
    var id: String?
    var subtitle: String?
    var title: String?
    
    enum Key: String, CodingKey {
        case id
        case subtitle
        case title
    }
}
