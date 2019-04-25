//
//  ArrayExtension.swift
//  qlh-ios
//
//  Created by Daniel Avram on 20/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

extension Array {
    func element(at index: Index) -> Element? {
        guard 0 ..< count ~= index else { return nil }
        return self[index]
    }

    func element<T>(at index: Index) -> T? {
        let generic = element(at: index) as? T
        return generic
    }

    func isFirst(index: Index, offset: Index = 0) -> Bool {
        guard count > 0,
            0 ..< count ~= index + offset else { return false }
        return index == offset
    }

    func isLast(index: Index, offset: Index = 0) -> Bool {
        guard count > 0,
            0 ..< count ~= index + offset else { return false }
        return index == count - 1 + offset
    }
}
