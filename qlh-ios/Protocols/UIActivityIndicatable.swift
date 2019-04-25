//
//  UIActivityIndicatable.swift
//  qlh-ios
//
//  Created by Daniel Avram on 25/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

protocol UIActivityIndicatable: class {
    func startLoading()
    func stopLoading()
}

extension UIActivityIndicatable {
    func startLoading() {
        Application.spinner.start(from: self)
    }

    func stopLoading() {
        Application.spinner.stop(from: self)
    }
}
