//
//  AnimatableGradient.swift
//  qlh-ios
//
//  Created by Daniel Avram on 24/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

protocol AnimatableGradient: class {
    var isLoopable: Bool { get set }
    var gradient: CAGradientLayer! { get }
    var gradientContainer: UIView! { get }
    var stepDuration: CFTimeInterval! { get }
    var colors: CircularList<GradientColor>! { get }
    var currentPoint: GradientPoint { get set }
    var pointTick: CGFloat { get }
    func initializeGradient()
    func updateGradient(size: CGSize)
    func animate()
}

extension AnimatableGradient where Self: UIViewController & CAAnimationDelegate {
    func initializeGradient() {
        gradientContainer.layer.addSublayer(gradient)
        gradient.drawsAsynchronously = true
        updateGradient(size: gradientContainer.bounds.size)
    }

    func updateGradient(size: CGSize) {
        gradient.frame.origin = gradientContainer.bounds.origin
        gradient.frame.size = size
    }

    func animate() {
        gradient.colors = colors.current?.value
        currentPoint.advance(by: pointTick)
        gradient.endPoint = currentPoint.to
        gradient.startPoint = currentPoint.from
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.delegate = self
        gradientChangeAnimation.duration = stepDuration
        gradientChangeAnimation.toValue = colors.next?.value
        gradientChangeAnimation.fillMode = .forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradient.add(gradientChangeAnimation, forKey: "colorChange")
    }
}
