//
//  NameIdentifiable.swift
//  qlh-ios
//
//  Created by Daniel Avram on 05/05/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

protocol NameIdentifiable {
    static var identifier: String { get }
}

extension NameIdentifiable {
    static var identifier: String {
        return String(describing: Self.self)
    }
}
