//
//  GradientPoint.swift
//  qlh-ios
//
//  Created by Daniel Avram on 20/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

struct GradientPoint {
    private(set) var from: CGPoint
    private(set) var to: CGPoint

    init(from: CGPoint) {
        self.from = from.clamped(within: 0 ... 1)
        to = GradientPoint.newTo(from: self.from)
    }

    static func newTo(from: CGPoint) -> CGPoint {
        let newX = 1 - from.x
        let newY = 1 - from.y
        return CGPoint(x: newX, y: newY)
    }

    mutating func advance(by angle: CGFloat) {
        let originX = from.x - 0.5
        let originY = from.y - 0.5
        var radians = atan2(originY, originX)
        while radians < 0 {
            radians += CGFloat(2 * Double.pi)
        }
        radians = radians + angle
        let newX = 0.5 + cos(radians)
        let newY = 0.5 + sin(radians)
        let newFrom = CGPoint(x: newX, y: newY)
        from = newFrom.clamped(within: 0 ... 1)
        to = GradientPoint.newTo(from: from)
    }

    static var top: GradientPoint = .init(from: .init(x: 0.5, y: 0))
}
