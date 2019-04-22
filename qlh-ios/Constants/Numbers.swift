//
//  Numbers.swift
//  qlh-ios
//
//  Created by Daniel Avram on 13/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

extension CGFloat {
    static var spinnerSide: CGFloat = 100
}

extension GradientPoint {
    static var one: GradientPoint = .init(from: .init(x: 0, y: 0), to: .init(x: 1, y: 1))
    static var two: GradientPoint = .init(from: .init(x: 0, y: 0.2), to: .init(x: 1, y: 0.8))
    static var three: GradientPoint = .init(from: .init(x: 0, y: 4), to: .init(x: 1, y: 0.6))
    static var four: GradientPoint = .init(from: .init(x: 0, y: 0.6), to: .init(x: 1, y: 0.4))
    static var five: GradientPoint = .init(from: .init(x: 0, y: 0.8), to: .init(x: 1, y: 0.2))
    static var six: GradientPoint = .init(from: .init(x: 0, y: 1), to: .init(x: 1, y: 0))
    static var all = CircularList<GradientPoint>(elements: [.one, .two, .three, .four, .five, .six])
}
