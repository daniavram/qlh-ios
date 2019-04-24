//
//  Spinner.swift
//  qlh-ios
//
//  Created by Daniel Avram on 13/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class Spinner: UIViewController {
    private(set) var parentObject: AnyObject?
    private(set) var container = UIView(frame: .init(origin: .zero, size: UIScreen.main.bounds.size))
    private(set) var stepDuration: CFTimeInterval!
    private(set) var colors: CircularList<GradientColor>!
    private(set) var points: CircularList<GradientPoint>!
    private let gradient = CAGradientLayer()
    private let blurEffectView = UIVisualEffectView(frame: .init(origin: .zero, size: UIScreen.main.bounds.size))

    func initialize(side: CGFloat,
                    stepDuration: CFTimeInterval,
                    colors: CircularList<GradientColor>,
                    points: CircularList<GradientPoint>) {
        self.stepDuration = stepDuration
        self.colors = colors
        self.points = points
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        container.addSubview(blurEffectView)
        let gradientContainer = UIView(frame: .init(origin: .zero, size: .square(of: side)))
        gradientContainer.layer.addSublayer(gradient)
        gradientContainer.clipsToBounds = true
        gradientContainer.layer.cornerRadius = 0.5 * side
        gradientContainer.center = container.center
        container.addSubview(gradientContainer)
        gradient.frame = gradientContainer.bounds
        gradient.drawsAsynchronously = true
    }

    private func animate() {
        gradient.colors = colors.current?.value
        if let from = points.next?.from,
            let to = points.next?.to {
            // change gradient start / end points
            gradient.endPoint = to
            gradient.startPoint = from
        }
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.delegate = self
        gradientChangeAnimation.duration = stepDuration
        gradientChangeAnimation.toValue = colors.next?.value
        gradientChangeAnimation.fillMode = .forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradient.add(gradientChangeAnimation, forKey: "colorChange")
    }

    func start(from parent: AnyObject, blurEffect: UIBlurEffect.Style = .dark) {
        guard parentObject == nil else { return }
        parentObject = parent
        blurEffectView.effect = UIBlurEffect(style: blurEffect)
        UIApplication.shared.delegate?.window??.addSubview(container)
        animate()
    }

    func stop(from parent: AnyObject) {
        guard parentObject?.isEqual(parent) == true else { return }
        container.removeFromSuperview()
    }
}

extension Spinner: CAAnimationDelegate {
    func animationDidStop(_: CAAnimation, finished flag: Bool) {
        guard flag else { return }
        animate()
    }
}
