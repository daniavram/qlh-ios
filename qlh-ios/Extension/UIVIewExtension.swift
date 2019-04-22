//
//  UIVIewExtension.swift
//  qlh-ios
//
//  Created by Daniel Avram on 14/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

extension UIView {
    func addSubview(_ view: UIView, withPadding padding: UIEdgeInsets) {
        addSubview(view)
        view.topAnchor.constraint(equalTo: topAnchor, constant: padding.top).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: padding.bottom).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding.right).isActive = true
    }
}
