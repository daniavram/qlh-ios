//
//  Application.swift
//  qlh-ios
//
//  Created by Daniel Avram on 13/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class Application {
    static var spinner = Spinner()
    static func initialize() {
        spinner.initialize(size: .spinner,
                           stepDuration: 0.7,
                           colors: GradientColor.all)
    }
}
