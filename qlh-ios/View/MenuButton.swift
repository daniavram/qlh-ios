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
        clipsToBounds = true
        _ = constraint(to: size)
        superview.addSubview(self)
        let arrowSize: CGSize = .init(width: 3,
                                      height: 15)
        let maskLayer = CAShapeLayer()
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.path = MenuButton.arrowPath(ofSize: arrowSize, in: size)
        maskLayer.fillRule = .evenOdd
        layer.mask = maskLayer
        maskLayer.position = .init(x: 0.5 * size.width, y: -0.5 * arrowSize.height)
        let tr = CATransform3DRotate(maskLayer.transform, .pi * 0.25, 0, 0, 1)
        maskLayer.transform = tr

        // add shadow

        let shadowRadius: CGFloat = 6
        shadowView = UIView(frame: .zero)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = shadowRadius
        shadowView.layer.shadowOpacity = 1
        shadowView.layer.shadowPath = MenuButton.arrowShadow(ofHeight: arrowSize.height + shadowRadius, in: size)
        superview.addSubview(shadowView)
        _ = shadowView.constraint(to: size)
        _ = shadowView.constraintCenters(to: self)
    }
}
