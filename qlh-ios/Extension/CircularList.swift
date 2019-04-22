//
//  CircularList.swift
//  qlh-ios
//
//  Created by Daniel Avram on 20/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

class CircularList<Element: Any> {
    private(set) var elements: [Element] = []
    private var currentIndex: Int?

    var current: Element? {
        guard let currentIndex = currentIndex else { return nil }
        let element = elements.element(at: currentIndex)
        return element
    }

    var next: Element? {
        guard let currentIndex = currentIndex,
            elements.count > 0 else { return nil }
        self.currentIndex = currentIndex == elements.count - 1 ? 0 : currentIndex + 1
        return current
    }

    var previous: Element? {
        guard let currentIndex = currentIndex,
            elements.count > 0 else { return nil }
        self.currentIndex = currentIndex == 0 ? elements.count - 1 : currentIndex - 1
        return current
    }

    init(elements: [Element]) {
        self.elements = elements
        currentIndex = elements.count > 0 ? 0 : nil
    }
}
