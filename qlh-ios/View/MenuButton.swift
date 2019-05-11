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
        let arrowSize: CGSize = .init(width: 4,
                                      height: max(10, floor(0.25 * size.height)))
        let maskLayer = CAShapeLayer()
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.path = .arrow(ofSize: arrowSize, in: size, withRoundedCorners: false)
        maskLayer.fillRule = .evenOdd
        layer.mask = maskLayer
        clipsToBounds = true

        // add shadow

        let shadowRadius: CGFloat = 6
        let shadowSize: CGSize = .init(width: size.width + shadowRadius, height: size.height + shadowRadius)
        let shadowCutawaySize: CGSize = .init(width: arrowSize.width + 2 * shadowRadius, height: arrowSize.height + 2 * shadowRadius)
        shadowView = UIView(frame: .zero)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = shadowRadius
        shadowView.layer.shadowOpacity = 1
        shadowView.layer.shadowPath = .arrow(ofSize: shadowCutawaySize, in: shadowSize, withRoundedCorners: true)
        superview.addSubview(shadowView)
        _ = shadowView.constraint(to: size)
        _ = shadowView.constraintCenters(to: self)
    }
}
