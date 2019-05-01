//
//  InstantPanGestureRecognizer.swift
//  qlh-ios
//
//  Created by Daniel Avram on 30/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class InstantPanGestureRecognizer: UIPanGestureRecognizer {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        if state == .began { return }
        super.touchesBegan(touches, with: event)
        state = .began
    }
}
