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
        backgroundColor = .clear
        layer.cornerRadius = 0.5 * size.height
        _ = constraint(to: size)

        // make cut

        let arrowSize: CGSize = .init(width: 4, height: 12)
        let arrowPadding: UIEdgeInsets = .pairs(vertical: 5, horizontal: 6)
        let startingY = 0.33 * size.height

        let path = CGMutablePath()
//        path.addArc(center: CGPoint(x: 0.5 * size.width, y: 0.5 * size.height),
//                    radius: 10,
//                    startAngle: 0.0,
//                    endAngle: 2.0 * .pi,
//                    clockwise: false)
        path.addRect(CGRect(origin: .zero, size: size))
        path.move(to: .init(x: 0.5 * size.width, y: startingY))
        path.addLine(to: CGPoint(x: arrowPadding.left, y: startingY + arrowSize.height))
        path.addLine(to: CGPoint(x: arrowPadding.left, y: startingY + arrowSize.height + arrowSize.width))
        // add arc here
        path.addLine(to: CGPoint(x: 0.5 * size.width, y: startingY + arrowSize.width))
        path.addLine(to: CGPoint(x: size.width - arrowPadding.right, y: startingY + arrowSize.height + arrowSize.width))
        // add arc here
        path.addLine(to: CGPoint(x: size.width - arrowPadding.right, y: startingY + arrowSize.height))
        let maskLayer = CAShapeLayer()
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.path = path
        maskLayer.fillRule = .evenOdd
        layer.mask = maskLayer
        clipsToBounds = true

        let vibrancyEffect = UIBlurEffect(style: .prominent)
        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyView.translatesAutoresizingMaskIntoConstraints = false
        _ = addSubview(vibrancyView, withPadding: .zero)

        // add shadow

//        let shadowLayer = CALayer()
//        shadowLayer.shadowColor = UIColor.gray.cgColor
//        shadowLayer.shadowOffset = .zero
//        shadowLayer.shadowRadius = 8
//        shadowLayer.shadowOpacity = 1
//        shadowLayer.shadowPath = outterPath.cgPath
//        layer.addSublayer(shadowLayer)
    }
}
