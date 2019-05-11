//
//  Numbers.swift
//  qlh-ios
//
//  Created by Daniel Avram on 13/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

extension CGSize {
    static var spinner: CGSize = .square(of: 100)
}

extension CGPath {
    static func arrow(ofSize arrowSize: CGSize, in parentSize: CGSize, withRoundedCorners: Bool = false) -> CGPath {
        // numbers
        let arrowPadding: CGFloat = max(8, floor(0.1 * parentSize.height))
        let arrowTotalHeight = arrowSize.height + arrowSize.width * sqrt(2)
        let startingY = 0.5 * (parentSize.height - arrowTotalHeight)
        let arrowLowY = parentSize.height - 0.5 * (parentSize.height - arrowTotalHeight)
        // construct path
        let path = CGMutablePath()
        if withRoundedCorners {
            path.addRoundedRect(in: .init(origin: .zero, size: parentSize),
                                cornerWidth: 0.5 * parentSize.width,
                                cornerHeight: 0.5 * parentSize.height)
        } else {
            path.addRect(CGRect(origin: .zero, size: parentSize))
        }
        path.move(to: .init(x: 0.5 * parentSize.width, y: startingY))
        path.addLine(to: CGPoint(x: arrowPadding, y: startingY + arrowSize.height))
        path.addLine(to: CGPoint(x: arrowPadding, y: arrowLowY))
        // TODO: Could add arc here
        path.addLine(to: CGPoint(x: 0.5 * parentSize.width, y: startingY + arrowSize.width * sqrt(2)))
        path.addLine(to: CGPoint(x: parentSize.width - arrowPadding, y: arrowLowY))
        // TODO: Could add arc here
        path.addLine(to: CGPoint(x: parentSize.width - arrowPadding, y: startingY + arrowSize.height))
        return path
    }
}
