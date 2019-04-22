//
//  GradientPoint.swift
//  qlh-ios
//
//  Created by Daniel Avram on 20/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

struct GradientPoint {
    private(set) var from: CGPoint
    private(set) var to: CGPoint
    
    init(from: CGPoint, to: CGPoint) {
        self.from = from
        self.to = to
    }
}
