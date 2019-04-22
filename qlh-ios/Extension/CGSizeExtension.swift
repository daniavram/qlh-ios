//
//  CGSizeExtension.swift
//  qlh-ios
//
//  Created by Daniel Avram on 13/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

extension CGSize {
    static func square(of side: CGFloat) -> CGSize {
        return .init(width: side, height: side)
    }
}
