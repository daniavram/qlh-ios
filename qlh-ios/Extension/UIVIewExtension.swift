//
//  UIVIewExtension.swift
//  qlh-ios
//
//  Created by Daniel Avram on 14/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

extension UIView {
    func addSubview(_ view: UIView, withPadding padding: UIEdgeInsets) -> Anchors {
        addSubview(view)
        let anchors = Anchors()
        anchors.top = view.topAnchor.constraint(equalTo: topAnchor, constant: 0)
        anchors.left = view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
        anchors.bottom = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        anchors.right = trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        anchors.setConstants(to: padding)
        anchors.makeAll(active: true)
        return anchors
    }

    func addSubview(_ view: UIView, withCenterOffset offset: CGPoint) -> Centers {
        addSubview(view)
        let centers = Centers()
        centers.x = view.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        centers.y = view.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        centers.setConstants(to: offset)
        centers.makeAll(active: true)
        return centers
    }

    func constraint(to size: CGSize) -> Sizes {
        let sizes = Sizes()
        sizes.width = widthAnchor.constraint(equalToConstant: 0)
        sizes.height = heightAnchor.constraint(equalToConstant: 0)
        sizes.setConstants(to: size)
        sizes.makeAll(active: true)
        return sizes
    }

    func constraintCenters(to view: UIView) -> Centers {
        let centers = Centers()
        centers.x = view.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        centers.y = view.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        centers.setConstants(to: .zero)
        centers.makeAll(active: true)
        return centers
    }
}

extension UIView {
    class Anchors: Constraintable {
        var top: NSLayoutConstraint?
        var bottom: NSLayoutConstraint?
        var left: NSLayoutConstraint?
        var right: NSLayoutConstraint?
        lazy var all: [NSLayoutConstraint?] = [top, bottom, left, right]

        func setConstants(to insets: UIEdgeInsets) {
            setConstants(values: [insets.top, insets.bottom, insets.left, insets.right])
        }
    }

    class Centers: Constraintable {
        var x: NSLayoutConstraint?
        var y: NSLayoutConstraint?
        lazy var all: [NSLayoutConstraint?] = [x, y]

        func setConstants(to offset: CGPoint) {
            setConstants(values: [offset.x, offset.y])
        }
    }

    class Sizes: Constraintable {
        var width: NSLayoutConstraint?
        var height: NSLayoutConstraint?
        lazy var all: [NSLayoutConstraint?] = [width, height]

        func setConstants(to size: CGSize) {
            setConstants(values: [size.width, size.height])
        }
    }
}

protocol Constraintable {
    /// All the constraints which can be activated / changed
    var all: [NSLayoutConstraint?] { get }

    /// Activate / deactivate constraints
    ///
    /// - Parameter active: true / false
    func makeAll(active: Bool)
}

extension Constraintable {
    func makeAll(active: Bool) {
        all.forEach { $0?.isActive = active }
    }

    /// Sets new constant values to `all` constraints. The order of values in the array is crucial! For each element in `all`, the constant from `values` will be applied
    ///
    /// - Parameter values: Array of constant values
    func setConstants(values: [CGFloat]) {
        assert(values.count == all.count, "Number of Constraints (\(all.count)) must be equal to number of Values (\(values.count))")
        let paired = zip(all, values)
        paired.forEach { $0.0?.constant = $0.1 }
    }
}
