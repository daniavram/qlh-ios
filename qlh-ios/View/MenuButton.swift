//
//  MenuButton.swift
//  qlh-ios
//
//  Created by Daniel Avram on 01/05/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class MenuButton: UIView {
    private var size: CGSize!
    private(set) var shadowView: UIView!

    convenience init(size: CGSize, superview: UIView) {
        self.init(frame: .zero)
        self.size = size
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.cornerRadius = 0.5 * size.height
        _ = constraint(to: size)
        superview.addSubview(self)

        // make cut

        let arrowSize: CGSize = .init(width: max(1, floor(0.1 * size.height)),
                                      height: max(10, floor(0.33 * size.height)))
        let arrowPadding: CGFloat = max(5, floor(0.1 * size.height))
        let startingY = 0.275 * size.height

        let path = CGMutablePath()
        path.addRect(CGRect(origin: .zero, size: size))
        path.move(to: .init(x: 0.5 * size.width, y: startingY))
        path.addLine(to: CGPoint(x: arrowPadding, y: startingY + arrowSize.height))
        path.addLine(to: CGPoint(x: arrowPadding + 0.5 * arrowSize.width, y: startingY + arrowSize.height + arrowSize.width))
        // add arc here
        path.addLine(to: CGPoint(x: 0.5 * size.width, y: startingY + arrowSize.width * sqrt(2)))
        path.addLine(to: CGPoint(x: size.width - arrowPadding - 0.5 * arrowSize.width, y: startingY + arrowSize.height + arrowSize.width))
        // add arc here
        path.addLine(to: CGPoint(x: size.width - arrowPadding, y: startingY + arrowSize.height))
        let maskLayer = CAShapeLayer()
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.path = path
        maskLayer.fillRule = .evenOdd
        layer.mask = maskLayer
        clipsToBounds = true

        // add shadow

        let shadowRadius: CGFloat = 8
        let shadowPath = CGMutablePath()
        shadowPath.addRoundedRect(in: .init(origin: .zero, size: size), cornerWidth: 0.5 * size.width, cornerHeight: 0.5 * size.height)
        shadowPath.move(to: .init(x: 0.5 * size.width, y: startingY - shadowRadius))
        shadowPath.addLine(to: CGPoint(x: max(0, arrowPadding - shadowRadius), y: startingY + arrowSize.height - shadowRadius))
        shadowPath.addLine(to: CGPoint(x: arrowPadding + 0.5 * arrowSize.width + shadowRadius, y: startingY + arrowSize.height + arrowSize.width + shadowRadius))
        shadowPath.addLine(to: CGPoint(x: 0.5 * size.width, y: startingY + arrowSize.width * sqrt(2) + shadowRadius))
        shadowPath.addLine(to: CGPoint(x: size.width - arrowPadding - 0.5 * arrowSize.width - shadowRadius, y: startingY + arrowSize.height + arrowSize.width + shadowRadius))
        shadowPath.addLine(to: CGPoint(x: size.width - arrowPadding + shadowRadius, y: startingY + arrowSize.height - shadowRadius))
        shadowView = UIView(frame: .zero)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = shadowRadius
        shadowView.layer.shadowOpacity = 1
        shadowView.layer.shadowPath = shadowPath
        superview.addSubview(shadowView)
        _ = shadowView.constraint(to: size)
        _ = shadowView.constraintCenters(to: self)
    }
}
