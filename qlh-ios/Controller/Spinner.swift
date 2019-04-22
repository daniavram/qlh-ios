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
    private let gradient = CAGradientLayer()
    private let blurEffectView = UIVisualEffectView(frame: .init(origin: .zero, size: UIScreen.main.bounds.size))

    func initialize() {
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        container.addSubview(blurEffectView)
        let gradientContainer = UIView(frame: .init(origin: .zero, size: .square(of: .spinnerSide)))
        gradient.frame = gradientContainer.bounds
        gradient.colors = GradientColor.all.current?.value
        gradient.drawsAsynchronously = true
        gradientContainer.layer.addSublayer(gradient)
        gradientContainer.clipsToBounds = true
        gradientContainer.layer.cornerRadius = 0.5 * CGFloat.spinnerSide
        container.addSubview(gradientContainer)
        gradientContainer.center = container.center
    }

    private func animate() {
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.delegate = self
        gradientChangeAnimation.duration = 0.7
        gradientChangeAnimation.toValue = GradientColor.all.next?.value
        gradientChangeAnimation.fillMode = .forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        if let from = GradientPoint.all.next?.from {
            gradient.startPoint = from
        }
        if let to = GradientPoint.all.next?.to {
            gradient.endPoint = to
        }
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
        gradient.colors = GradientColor.all.current?.value
        animate()
    }
}
