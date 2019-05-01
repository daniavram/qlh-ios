//
//  SideMenu.swift
//  qlh-ios
//
//  Created by Daniel Avram on 30/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class SideMenu: UIViewController {
    private var menuButton: UIView!
    private var overlayView: UIView!
    private var container: UIView!

    /// Menu button bottom constraint
    private var bottomConstraint = NSLayoutConstraint()
    /// The current state of the animation. This variable is changed only when an animation completes.
    private var currentState: State = .closed
    /// All of the currently running animators.
    private var runningAnimators = [UIViewPropertyAnimator]()
    /// The progress of each animator. This array is parallel to the `runningAnimators` array.
    private var animationProgress = [CGFloat]()
    /// Pan recognizer for button
    private lazy var panRecognizer: InstantPanGestureRecognizer = {
        let recognizer = InstantPanGestureRecognizer()
        recognizer.addTarget(self, action: #selector(popupViewPanned(recognizer:)))
        return recognizer
    }()

    /// Pan recognizer for container
    private lazy var containerPanRecognizer: InstantPanGestureRecognizer = {
        let recognizer = InstantPanGestureRecognizer()
        recognizer.addTarget(self, action: #selector(popupViewPanned(recognizer:)))
        return recognizer
    }()

    func initialize() {
        guard let wrappedWindow = UIApplication.shared.delegate?.window,
            let window = wrappedWindow else { return }
        overlayView = UIView(frame: .zero)
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        overlayView.alpha = 0
        _ = window.addSubview(overlayView, withPadding: .zero)
        menuButton = UIView(frame: .zero)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.backgroundColor = .red
        menuButton.layer.cornerRadius = 22
        _ = menuButton.constraint(to: .square(of: 44))
        window.addSubview(menuButton)
        menuButton.leadingAnchor.constraint(equalTo: window.leadingAnchor, constant: 22).isActive = true
        bottomConstraint = window.bottomAnchor.constraint(equalTo: menuButton.bottomAnchor, constant: 22)
        bottomConstraint.isActive = true
        container = UIView(frame: .zero)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.cornerRadius = 22
        window.addSubview(container)
        container.leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: window.trailingAnchor).isActive = true
        container.topAnchor.constraint(equalTo: menuButton.bottomAnchor, constant: 22).isActive = true
        container.heightAnchor.constraint(equalToConstant: 500).isActive = true
        container.addGestureRecognizer(containerPanRecognizer)
        menuButton.addGestureRecognizer(panRecognizer)
    }

    func show() {
        UIApplication.shared.delegate?.window??.bringSubviewToFront(overlayView)
        UIApplication.shared.delegate?.window??.bringSubviewToFront(menuButton)
        UIApplication.shared.delegate?.window??.bringSubviewToFront(container)
    }

    func hide() {
        UIApplication.shared.delegate?.window??.sendSubviewToBack(overlayView)
        UIApplication.shared.delegate?.window??.sendSubviewToBack(menuButton)
        UIApplication.shared.delegate?.window??.sendSubviewToBack(container)
    }

    /// Animates the transition, if the animation is not already running.
    private func animateTransitionIfNeeded(to state: State, duration: TimeInterval) {
        // ensure that the animators array is empty (which implies new animations need to be created)
        guard runningAnimators.isEmpty else { return }

        // an animator for the transition
        let transitionAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1, animations: {
            switch state {
            case .open:
                self.bottomConstraint.constant = 300
                self.overlayView.alpha = 0.5
            case .closed:
                self.bottomConstraint.constant = 22
                self.overlayView.alpha = 0
            }
            UIApplication.shared.delegate?.window??.layoutIfNeeded()
        })

        // the transition completion block
        transitionAnimator.addCompletion { position in

            // update the state
            switch position {
            case .start:
                self.currentState = state.opposite
            case .end:
                self.currentState = state
            default:
                ()
            }

            // manually reset the constraint positions
            switch self.currentState {
            case .open:
                self.bottomConstraint.constant = 300
            case .closed:
                self.bottomConstraint.constant = 22
            }

            // remove all running animators
            self.runningAnimators.removeAll()
        }

        // start all animators
        transitionAnimator.startAnimation()

        // keep track of all running animators
        runningAnimators.append(transitionAnimator)
    }

    @objc private func popupViewPanned(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:

            // start the animations
            animateTransitionIfNeeded(to: currentState.opposite, duration: 1)

            // pause all animations, since the next event may be a pan changed
            runningAnimators.forEach { $0.pauseAnimation() }

            // keep track of each animator's progress
            animationProgress = runningAnimators.map { $0.fractionComplete }

        case .changed:

            // variable setup
            let translation = recognizer.translation(in: overlayView)
            var fraction = -translation.y / 300

            // adjust the fraction for the current state and reversed state
            if currentState == .open { fraction *= -1 }
            if runningAnimators.first?.isReversed == true {
                fraction *= -1
            }

            // apply the new fraction
            for (index, animator) in runningAnimators.enumerated() {
                animator.fractionComplete = fraction + animationProgress[index]
            }

        case .ended:

            // variable setup
            let yVelocity = recognizer.velocity(in: container).y
            let shouldClose = yVelocity > 0

            // if there is no motion, continue all animations and exit early
            if yVelocity == 0 {
                runningAnimators.forEach { $0.continueAnimation(withTimingParameters: nil, durationFactor: 0) }
                break
            }

            // reverse the animations based on their current state and pan motion
            switch currentState {
            case .open:
                if !shouldClose, runningAnimators.first?.isReversed == false {
                    runningAnimators.forEach { $0.isReversed = !$0.isReversed }
                }
                if shouldClose, runningAnimators.first?.isReversed == true {
                    runningAnimators.forEach { $0.isReversed = !$0.isReversed }
                }
            case .closed:
                if shouldClose, runningAnimators.first?.isReversed == false {
                    runningAnimators.forEach { $0.isReversed = !$0.isReversed }
                }
                if !shouldClose, runningAnimators.first?.isReversed == true {
                    runningAnimators.forEach { $0.isReversed = !$0.isReversed }
                }
            }

            // continue all animations
            runningAnimators.forEach { $0.continueAnimation(withTimingParameters: nil, durationFactor: 0) }

        default:
            ()
        }
    }
}

extension SideMenu {
    enum State {
        case closed
        case open

        var opposite: State {
            switch self {
            case .open: return .closed
            case .closed: return .open
            }
        }
    }
}
