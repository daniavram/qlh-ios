//
//  CGPointExtension.swift
//  qlh-ios
//
//  Created by Daniel Avram on 24/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

extension CGPoint {
    func clamped(within range: ClosedRange<CGFloat>) -> CGPoint {
        let newX = min(max(x, range.lowerBound), range.upperBound)
        let newY = min(max(y, range.lowerBound), range.upperBound)
        return CGPoint(x: newX, y: newY)
    }
}
