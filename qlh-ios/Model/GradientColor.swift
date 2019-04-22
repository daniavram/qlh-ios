//
//  GradientColor.swift
//  qlh-ios
//
//  Created by Daniel Avram on 13/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

struct GradientColor {
    private(set) var primary: UIColor
    private(set) var secondary: UIColor

    var value: [CGColor] {
        return [primary.cgColor, secondary.cgColor]
    }

    static func == (lhs: GradientColor, rhs: GradientColor) -> Bool {
        return lhs.primary.isEqual(rhs.primary) && lhs.secondary.isEqual(rhs.secondary)
    }
}
