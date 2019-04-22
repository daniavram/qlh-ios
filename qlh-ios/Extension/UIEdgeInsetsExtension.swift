//
//  UIEdgeInsetsExtension.swift
//  qlh-ios
//
//  Created by Daniel Avram on 14/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    static func all(with spacing: CGFloat) -> UIEdgeInsets {
        return .init(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }

    static func pairs(vertical vSpacing: CGFloat, horizontal hSpacing: CGFloat) -> UIEdgeInsets {
        return .init(top: vSpacing, left: hSpacing, bottom: vSpacing, right: hSpacing)
    }
}
