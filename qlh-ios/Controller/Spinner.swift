//
//  Spinner.swift
//  qlh-ios
//
//  Created by Daniel Avram on 13/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class Spinner: UIViewController, CAAnimationDelegate, AnimatableGradient {
    var isLoopable: Bool = true
    var gradient: CAGradientLayer!
    var gradientContainer: UIView!
    var stepDuration: CFTimeInterval!
    var colors: CircularList<GradientColor>!
    var currentPoint: GradientPoint = .top
    var pointTick: CGFloat = 0.35

    private(set) var parentObject: AnyObject?
    private(set) var container = UIView(frame: .zero)
    private let blurEffectView = UIVisualEffectView(frame: .init(origin: .zero, size: UIScreen.main.bounds.size))

    func initialize(size: CGSize,
                    stepDuration: CFTimeInterval,
                    colors: CircularList<GradientColor>) {
        self.stepDuration = stepDuration
        self.colors = colors
        container.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        container.addSubview(blurEffectView)
        gradientContainer = UIView(frame: .init(origin: .zero, size: size))
        gradientContainer.translatesAutoresizingMaskIntoConstraints = false
        gradientContainer.clipsToBounds = true
        gradientContainer.layer.cornerRadius = 0.5 * size.height
        gradientContainer.constraint(to: size)
        container.addSubview(gradientContainer, withCenterOffset: .zero)
        gradient = CAGradientLayer()
        initializeGradient()
    }

    func start(from parent: AnyObject, blurEffect: UIBlurEffect.Style = .dark) {
        guard parentObject == nil else { return }
        parentObject = parent
        blurEffectView.effect = UIBlurEffect(style: blurEffect)
        UIApplication.shared.delegate?.window??.addSubview(container, withPadding: .zero)
        animate()
    }

    func stop(from parent: AnyObject) {
        guard parentObject?.isEqual(parent) == true else { return }
        container.removeFromSuperview()
    }

    func animationDidStop(_: CAAnimation, finished flag: Bool) {
        guard isLoopable, flag else { return }
        animate()
    }
}
