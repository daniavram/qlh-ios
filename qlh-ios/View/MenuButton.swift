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

    convenience init(size: CGSize) {
        self.init(frame: .zero)
        self.size = size
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .lightGray
        layer.cornerRadius = 0.5 * size.height
        _ = constraint(to: size)

        // make cut

        let path = CGMutablePath()
        path.addArc(center: CGPoint(x: 0.5 * size.width, y: 0.5 * size.height),
                    radius: 10,
                    startAngle: 0.0,
                    endAngle: 2.0 * .pi,
                    clockwise: false)
        path.addRect(CGRect(origin: .zero, size: size))
        let maskLayer = CAShapeLayer()
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.path = path
        maskLayer.fillRule = .evenOdd
        layer.mask = maskLayer
        clipsToBounds = true
    }
}
