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

extension MenuButton {
    static func arrowPath(ofSize arrowSize: CGSize, in parentSize: CGSize) -> CGPath {
        let path = CGMutablePath()

        path.addRect(CGRect(origin: .init(x: -0.5 * parentSize.width,
                                          y: -0.5 * parentSize.height),
                            size: .init(width: 2 * parentSize.width,
                                        height: 2 * parentSize.height)))

        let start = CGPoint(x: 0.5 * (parentSize.height - arrowSize.height),
                            y: 0.5 * (parentSize.height - arrowSize.height))

        path.move(to: start)
        path.addLine(to: .init(x: start.x,
                               y: start.y + arrowSize.height))
        path.addLine(to: .init(x: start.x + arrowSize.width,
                               y: start.y + arrowSize.height))
        path.addLine(to: .init(x: start.x + arrowSize.width,
                               y: start.y + arrowSize.width))
        path.addLine(to: .init(x: start.x + arrowSize.height,
                               y: start.y + arrowSize.width))
        path.addLine(to: .init(x: start.x + arrowSize.height,
                               y: start.y))
        return path
    }

    static func arrowShadow(ofHeight height: CGFloat, in parentSize: CGSize) -> CGPath {
        let path = CGMutablePath()

        path.addRoundedRect(in: .init(origin: .zero, size: parentSize),
                            cornerWidth: 0.5 * parentSize.width,
                            cornerHeight: 0.5 * parentSize.height)

        path.move(to: .init(x: 0.5 * parentSize.width,
                            y: 0.5 * (parentSize.height - height)))
        path.addLine(to: CGPoint(x: 0.5 * parentSize.width - height,
                                 y: 0.5 * (parentSize.height + height)))
        path.addLine(to: CGPoint(x: 0.5 * parentSize.width + height,
                                 y: 0.5 * (parentSize.height + height)))
        return path
    }
}
