//
//  DecodableExtension.swift
//  qlh-ios
//
//  Created by Daniel Avram on 25/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

extension Encodable {
    func data(with encoder: JSONEncoder = JSONEncoder()) -> Data? {
        let encoded = try? encoder.encode(self)
        return encoded
    }
}

extension Decodable {
    func decoded(with decoder: JSONDecoder = JSONDecoder(), from data: Data?) -> Self? {
        guard let data = data else { return nil }
        let decoded = try? decoder.decode(Self.self, from: data)
        return decoded
    }
}
