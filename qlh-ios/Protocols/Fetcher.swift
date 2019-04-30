//
//  Fetcher.swift
//  qlh-ios
//
//  Created by Daniel Avram on 25/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

protocol Fetcher: class {
    associatedtype FetchedType: Fetchable
    func didStartFetch()
    func didEndFetch()
    func didFetch(_ elements: FetchedType)
}

protocol Fetchable {}

extension Fetcher where Self: UIActivityIndicatable {
    func didStartFetch() {
        startLoading()
    }

    func didEndFetch() {
        stopLoading()
    }
}
