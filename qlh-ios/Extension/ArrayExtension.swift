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
}
