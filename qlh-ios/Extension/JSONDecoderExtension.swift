//
//  JSONDecoderExtension.swift
//  qlh-ios
//
//  Created by Daniel Avram on 25/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

extension JSONDecoder {
    static func object<T: Codable>(from string: String?) -> T? {
        guard let string = string,
            let jsonData = string.data(using: .utf8) else { return nil }
        let decoder = JSONDecoder()
        let object = try? decoder.decode(T.self, from: jsonData)
        return object
    }
}
